# Hash
# Los mapas (o hash)
# Tienen la gracia de que almacenan elementos y se accede a ellos mediante una llave (relación unica llave/valor)
# Se pueden declarar como sigue usando la sintaxis { simbolo: valor }
mapa = { llave1: 'valor 1', llave2: true, llave3: 3 }

puts mapa
puts mapa[:llave1]
puts mapa[:llave2]
puts mapa[:llave3]

# Los elementos que estoy usando como llave se llaman simbolos
# Los simbolos son un elemento básico
# Es como una variable, pero no tiene valor, es como una etiqueta nada más

# Bueno, pese a que los simbolos son útiles, también se pueden hacer hash con otro tipo de variables
# Para eso se usa otra sintaxis de hash, { llave => valor }
mapa2 = { 'llave string' => 'valor 1', true => 'este tenia llave booleana', 12 => 'este tenia llave numerica', llave_simbolo: 'valor con llave simbolo'}

puts mapa2
puts mapa2['llave string']
puts mapa2[true]
puts mapa2[12]
puts mapa2[:llave_simbolo]

# Naturalmente, también puedes seguir agregando valores despues
mapa2[:nueva_llave] = 4
puts mapa2[:nueva_llave]