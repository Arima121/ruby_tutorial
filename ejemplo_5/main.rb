# ciclos
# Primero el más simple, while
a = 10

puts 'ciclo while'
while a > 0
  puts a
  a -= 1 # a = a - 1
end

# También es posible usar la función times para repetir algo. La variable se inicia en 0
puts
puts 'ciclo usando times'
10.times do |var_iterador|
  puts var_iterador
end

# Podemos incluso iterar sobre un rango
puts
puts 'ciclo usando un rango con each'
(1..5).each do |var_iterador|
  puts var_iterador
end

# Es tambien each la forma de iterar sobre los arreglos
puts
puts 'ciclo de arreglo con each'
arreglo = [1, 2, 3]
arreglo.each do |elemento|
  puts elemento
end

# Se puede hacer incluso en una linea pasandole el bloque de código como parametro
puts
puts 'ciclo de arreglo con each en bloque de codigo como parametro'
arreglo.each { |elemento| puts elemento }

# Tambien se puede usar una versión alternativa que usa los indices
puts
puts 'ciclo de arreglo con each_with_index'
arreglo.each_with_index do |elemento, indice|
  puts "el elemento #{elemento} está en la posición #{indice}"
end

# Se pueden usar algunas palabras para alterar el ciclo: next pasa a la siguiente iteración, redo repite la operacion actual y break corta el ciclo
puts
puts 'ciclo con quiebres especiales'
flag = true
(1..10).each do |variable|
  puts "El valor actual es #{variable} y empieza la iteración actual"
  if variable == 3
    puts 'con 3, uso next y paso a la siguiente iteración automaticamente'
    next
  elsif variable == 5
    puts 'con 5 repito la iteración siempre que el flag sea true'
    if flag
      puts 'va a empezar otra vez esta iteración'
      flag = false
      redo
    end
    puts 'esta vez no se repetira porque ahora flag es false'
  elsif variable == 7
    puts 'esta es la última parte del ciclo porque se corta con 7'
    break
  else
    puts 'no se hace nada especial'
  end
  puts "El valor actual es #{variable} y se termina la iteración actual"
end