# IF
# La estructura del if es bastante simple y nos lleva a entender los bloques en ruby
# Los bloques se forman en base a tipo_bloque... end
# En este caso un bloque if
a = 1
if a == 1
  puts "entre al if porque la variable a = #{a}"
end

# Sin embargo, esa no es la mejor forma de usar los IF de una sola linea...
# Existe la siguiente estructura que sería el estandar para if de una linea (sin else)
puts "entre al if porque la variable a = #{a}" if a == 1

# Eso ejecuta la linea SI se cumple la condicion
# Podriamos decir que la lectura es diferente...
# El caso 1 sería "si se cumple la condición ejecuta el bloque (más de una linea)"
# El caso 2 sería "ejecuta esta linea si se cumple la condición"

# Por otro lado, también se puede hacer if.. else
if a == 1
  puts 'camino 1'
else
  puts 'camino 2'
end

# también se pueden encadenar if usando elsif
if a == 1
  puts 'camino 1'
elsif a == 2
  puts 'camino 2'
elsif a == 3
  puts 'camino 3'
else
  puts 'camino 4'
end

# Es importante destacar que es diferente a lo que sale a continuación
if a == 1
  puts 'camino 1'
else if a == 2
    puts 'camino 2'
  end
end
# esto es incorrecto, debe usarse elsif para este tipo de casos, ya que estariamos creando un nuevo bloque y generando anidación innecesaria

# algo interesante que tiene ruby, es que también existe la versión invertida del if, el unless
# Tal como su traducción directa, unless significa "a menos"
# En código, eso se podria decir que es "a menos que pase esto, ejecuta este bloque" (o bien la versión de una linea "has esto a menos que pase esto")

# versión de bloque
unless a != 1
  puts 'a == 1'
end
# La traducción sería... a menos que a sea distinto de 1, muestra que a es igual a 1

# versión de linea
puts 'a == 1' unless a != 1
#La traducción sería... muestra que a es igual a 1, a menos que a sea distinto de 1

# Por último, switch
# En realidad, en ruby "no hay" switch
# la instrucción se llama case y se usa así:

case a
when 'valor'
  puts 'si, es valor'
when 1
  puts 'es 1'
else
  puts 'otro valor'
end