# Lectura de archivos

# Cuando se necesita una libreria externa o bien archivos de otro módulo (que este en otro archivo)
# se utiliza la palabra require
# en este caso es para poder usar el JSON.parse
require 'json'

# podemos obtener la raiz de nuestro proyecto (ESTO NO ES NECESARIO PERO LO HACEMOS CUANDO NECESITAMOS LA RUTA)
APP_PATH = File.dirname(__FILE__)
puts APP_PATH

# Usamos la función read de la clase file para leer archivos
archivo = File.read("Objeto.json")

# Como puedes ver, el contenido del archivo ahora esta en esta variable
puts archivo

# Incluso podemos parsear el archivo a JSON usando la función JSON.parse (porque estaba en formato correcto JSON)
objeto = JSON.parse archivo

# con lo que luego podemos acceder a las variables contenidas en el archivo
puts objeto['nombre']
puts objeto['apellido']

# También puedes convertir un hash en un json usando la función JSON.generate
puts objeto.is_a? Hash
puts objeto
puts JSON.generate objeto

objeto['otra key'] = 'otro valor'

# Y podemos escribir archivos también...
File.write("Objeto2.json", JSON.generate(objeto))

