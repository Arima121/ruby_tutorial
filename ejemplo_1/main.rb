# Los comentarios en ruby se hacen con #

# Para ejecutar un programa en ruby no existe una regla en particular, puedes ponerle el nombre que quieras al archivo
# y el contenido de este no tiene que estar en ninguna clase en particular ni tener ninguna estructura definida

# Las funciones en ruby pueden o no llevar parentesis, pero se recomiendo no usarlos a menos que sea estrictamente necesario
# Por ejemplo las 2 lineas a continuación hacen exactamente lo mismo pero la primera sería la más usada (puts imprime por pantalla)
puts 'hola mundo!'
puts('hola mundo!')

# Las variables locales se inicializan directamente. Ruby no es un lenguaje fuertemente tipado, por lo que puedes hacer lo que quieras con las variables
nombre = 'Juan Topo'
puts "hola mundo con variables: hola #{ nombre }!"
nombre = 1
puts "ahora nombre es un numero!: nombre + 1 = #{ nombre + 1 }"
nombre = [1, 2, 3]
puts "ahora nombre es un arreglo :D!: #{ nombre }"
nombre = { llave: 'valor' }
puts "y ahora es un mapa (que en ruby son se llaman hash): #{ nombre } y se usan con la llave: #{ nombre[:llave] }"

# Si te diste cuenta, existen 2 tipos de string en ruby, uno con comillas simples ('') y otro con comillas dobles ("")
# El primero es un string simple
# El segundo, es interpolable. Puedes poner código dentro de ese string y se va a calcular cuando se lea el string
# la forma de hacerlo es con #{codigo}