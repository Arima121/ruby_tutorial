# Excepciones

# El manejo de excepciones en ruby es sencillo
# Se utiliza la palabra reservada rescue
# debe estar dentro de un bloque, por lo que se crea un bloque con begin...end

begin
  puts 'imprimir una variable inexistente'
  puts a
  puts 'no llega a esta linea de código'
  # StandardError es la clase más generica de errores en Ruby (al menos regulares, la más generica es error, pero es de más bajo nivel)
rescue StandardError => e
  puts 'a no existe'
  puts "este es el error: #{e}"
end

# es posible también añadir varios rescue con diferentes tipos de excepciones
begin
  puts 'otra ves...'
  puts a
rescue IOError
  puts 'tipo IOError'
rescue IndexError
  puts 'tipo IndexError'
rescue StandardError
  puts 'tipo StandardError porque no calza en otro tipo de arriba'
end

# tambien es posible generar excepciones en ciertos casos
def funcion_que_recibe_un_numero numero
  if numero.is_a? Numeric
    puts 'es un numero!'
  else
    # Esta linea genera una excepción de la clase ArgumentError con el contenido 'NO ES UN NUMERO!'
    raise ArgumentError, 'NO ES UN NÚMERO!'
  end
end

puts funcion_que_recibe_un_numero 1
# puts funcion_que_recibe_un_numero 'Hola :D'
# Lo antes mencionado generaría un error en la consola y cortaría el programa ahí

# ahora usaré una función que maneje ese error
# En este caso, como ya esta en un bloque, no es necesario usar begin...end
def funcion_que_usa_lo_anterior parametro
  puts 'esta funcion usa lo que se hizo antes...'
  funcion_que_recibe_un_numero parametro
rescue ArgumentError => e
  puts "ocurrio un error: #{e}"
end

funcion_que_usa_lo_anterior 1
funcion_que_usa_lo_anterior 'Hola :D'

# Al ejecutar el script podrás ver que se muestra el error al final tal como lo definimos

# Incluso es posible crear tus propias clases de errores extendiendo las ya existentes
class MiExcepcion < StandardError
end

def mi_funcion parameter
  if parameter != 10
    raise MiExcepcion, 'Mi parametro no es igual a 10!'
  end
end

begin
  puts 'voy a ejecutar mi_funcion con un 1'
  mi_funcion 1
rescue MiExcepcion => e
  puts "encontre un caso de tu excepcion! #{e}"
end