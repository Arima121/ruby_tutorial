# Funciones
# En ruby se pueden crear diversos tipos de funciones
# función sin parametros
# No es necesario poner parametros si la función no recibe parametros (tampoco en la llamada)
def mostrar_mensaje
  puts 'este es un mesaje fijo'
end

mostrar_mensaje

# función con parametros
# Se ponen los parentesis al definir el método pero no al llamarlo (a menos que sea estrictamente necesario)
def mostrar_mensaje_parametro(parametro)
  puts "este es un mensaje dinamico con parametro: #{parametro}"
end

mostrar_mensaje_parametro 'nombre'

# función con parametros opcionales
# A los parametros opcionales se les da un valor por defecto. Deben ir al final de la lista de parametros
def mostrar_mensaje_parametro_opcional(parametro_obligatorio, parametro_opcional = 'placeholder')
  puts "este parametro es obligatorio #{parametro_obligatorio} y este es opcional #{parametro_opcional}"
end

mostrar_mensaje_parametro_opcional 'valor_1'
mostrar_mensaje_parametro_opcional 'valor_2', 'valor_op'

# funciones que reciben bloques de código
# Se usa la palabra yield, donde este esa palabra es donde se ejecutará el bloque
def mostrar_mensaje_y_llamar_bloque
  puts 'este mensaje es fijo antes del bloque'
  yield if block_given? # block_given? valida si se envió o no un bloque al llamar la función
  puts 'este mensaje es fijo despues del bloque'
end

mostrar_mensaje_y_llamar_bloque { mostrar_mensaje_parametro 'local' }
mostrar_mensaje_y_llamar_bloque do
  puts 'primera linea del bloque'
  puts 'segunda linea del bloque'
end

# funciones que reciben bloques de código que reciben parametros
def mostrar_mensaje_y_llamar_bloque_con_parametros
  puts 'ahora se va a llamar al bloque con parametros'
  (1..3).each do |variable|
    yield variable if block_given?
  end
  puts 'ya se llamó el bloque'
end

mostrar_mensaje_y_llamar_bloque_con_parametros { |parametro| puts "esto se recibió: #{parametro}"}

# funciones que reciben parametros y bloques de código que no reciben parametros
def mostrar_mensaje_y_llamar_funcion_con_parametros_y_bloque_sin_parametros limite
  puts 'ahora se va a llamar al bloque con limite'
  (1..limite).each do
    yield if block_given?
  end
  puts 'ya se llamó el bloque'
end

# Para poder hacer una llamada de este tipo se deben poner parentesis a los parametros de la funcion
mostrar_mensaje_y_llamar_funcion_con_parametros_y_bloque_sin_parametros(2) { mostrar_mensaje }

# funciones que reciben parametros y bloques de código que reciben parametros
def mostrar_mensaje_y_llamar_funcion_con_parametros_y_bloque_con_parametros parametro
  puts 'esta funcion tiene un parametro'
  puts parametro
  puts 'ahora se va a llamar al bloque con parametros'
  yield parametro if block_given?
  puts 'ya se llamó el bloque'
end

mostrar_mensaje_y_llamar_funcion_con_parametros_y_bloque_con_parametros(10) { |valor| puts "soy #{valor}" }