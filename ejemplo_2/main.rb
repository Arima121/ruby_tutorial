# Arreglos
# Para manejar arreglos, tienes que hacer lo mismo que en java y c, sin embargo, estos arreglos son super dinamicos
arreglo = [1, 2, 3]

puts 'Todo el arreglo'
puts arreglo
puts 'cada elemento por separado'
puts arreglo[0]
puts arreglo[1]
puts arreglo[2]

# pero, puedo hacer esto...
arreglo[3] = 4

puts 'Todo el arreglo otra vez'
puts arreglo

# incluso, puedo hacer esto...
arreglo[7] = 8

puts 'Todo el arreglo otra vez'
puts arreglo

# cuando lo ejecutes, vas a ver que tiene muchos espacios en blanco, y eso es porque esta tratando de imprimir nil
# y deja los espacios. El tema es que automaticamente genera los espacios intermedios

# Por ultimo, tambien puedo hacer esto...
arreglo[4] = 'soy un string'
arreglo[5] = true
arreglo[6] = { llave: 'valor' }

puts 'Todo el arreglo otra vez'
puts arreglo

#El arreglo puede contener cosas del tipo que sea, recordemos que las variables no son tipadas