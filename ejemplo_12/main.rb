# Cliente REST
# antes de empezar... qué es REST?
# Es un protocolo de intercambio y manejo de datos via HTTP (otro protocolo)
# No se maneja estados (toda la data va en la petición)
# cada solicitud es represntable mediante una URL
# Se maneja via verbos HTTP (GET, POST, DELETE, PUT)
# La representación de datos se maneja sobre algún estandar de representación de objetos (xml, json, etc)
# Sobre lo mismo, un API REST es un sistema que obtiene información desde alguna fuente o bien realiza algún proceso
# y, usando REST como protocolo, entrega esa información

# para usar el restclient es necesario importarlo
require 'restclient'
# como convertiremos json a mapa, importaremos json tambien
require 'json'

# Usaremos como ejemplo https://mindicador.cl/
# Ellos tienen un api que entrega el valor del dolar

# crearemos una constante (empiezan con mayuscula [yo puse todas las letras con mayuscula por temas de orden])
# notese el uso de freeze, eso es porque las constantes igual pueden mutar en ruby... si, no son tan constantes
# y el metodo freeze obliga a que lo sean
MI_INDICADOR = 'https://mindicador.cl/api/dolar'.freeze

# Hagamos una llamada de ejemplo usando GET
respuesta_mi_indicador = RestClient.get(MI_INDICADOR)
puts 'La respuesta es de la clase...'
puts respuesta_mi_indicador.class
puts 'y trae un hash con headers...'
puts respuesta_mi_indicador.headers
puts 'tambien trae un codigo de respuesta (ver http status codes https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)'
puts respuesta_mi_indicador.code
puts 'y una descripción de lo que trae...'
puts respuesta_mi_indicador.description
puts 'Esta es la respuesta del api (body)'
puts respuesta_mi_indicador.body

# ahora creemos la función que haga la conversión de pesos a dolares (o dolares a pesos)
# primero una que obtenga el valor del dolar
def valor_dolar
  respuesta_api = RestClient.get(MI_INDICADOR)
  body = JSON.parse respuesta_api.body
  # aca podriamos usar la funcion dig en lugar de esto que escribimos...
  # sería body.dig('serie',0,'valor')
  # esta función entrega el valor buscado o nil si no pudo obtenerlo, lo que es mejor que lo que escribimos
  # lo usaremos de aca en adelante
  body['serie'][0]['valor']
rescue StandardError => e
  puts "Ocurrio un error: #{e}"
  0
end

def pesos_a_dolares pesos
  dolar = valor_dolar
  dolar.zero? ? 0 : pesos / dolar
end

def dolares_a_pesos dolar
  dolar * valor_dolar
end

# Mira la salida en la consola cuando se ejecute este script

puts "El valor del dolar es de #{valor_dolar} pesos"
puts "1000 pesos son #{pesos_a_dolares 1000} dolares"
puts "1000 dolares son #{dolares_a_pesos 1000} pesos"

# si se pudo notar la lentitud de cada request?
# eso es porque cada vez va a buscar el valor al api
# podriamos hacer una clase que mejore ese comportamiento...

class Dolares
  # Creamos un método para obtener el valor del dolar desde el api
  def self.obtener_valor_dolar
    respuesta_api = RestClient.get(MI_INDICADOR)
    body = JSON.parse respuesta_api.body
    body.dig('serie', 0, 'valor')
  rescue StandardError => e
    puts "Ocurrio un error: #{e}"
    0
  end

  # crearemos un metodo de clase (self) que obtiene el valor del dolar y lo guarda en una variable de clase (@@)
  def self.valor_dolar
    @@valor_dolar ||= obtener_valor_dolar
    @@valor_dolar
  end
  # notar el uso del operador ||=
  # lo que hace ||= es verificar el valor de la variable antes de asignar
  # si la variable no es nula, entrega ese valor y no ejecuta lo que esta despues
  # en este caso, si la variable @@valor_dolar ya tiene valor, no lo vuelve a obtener, por lo que no pregunta tantas veces al API

  def self.pesos_a_dolares pesos
    dolar = valor_dolar
    dolar.zero? ? 0 : pesos / dolar
  end

  def self.dolares_a_pesos dolar
    dolar * valor_dolar
  end

  # Le indicamos que métodos son privados usando esta instrucción
  # Si alguien quiere obtener el valor del dolar, debe usar la funcion valor_dolar
  private_class_method :obtener_valor_dolar
end

# notar la diferencia de esta ejecución con la anterior

puts "El valor del dolar es de #{Dolares.valor_dolar} pesos"
puts "1000 pesos son #{Dolares.pesos_a_dolares 1000} dolares"
puts "1000 dolares son #{Dolares.dolares_a_pesos 1000} pesos"