# Gemas
# Las gemas son librerias de código ruby
# Dichas gemas se pueden mantener mediante un manejador de dependencias
# El manejador por defecto de ruby es Bundler
# podemos installar bundler usando... gem install bundler
# Para administrar las gemas usaremos un archivo Gemfile
# Para que las gemas se descarguen y se instalen usamos el comando... bundle install

# Para este ejemplo puedes revisar el archivo Gemfile
# Ese documento indica de que repositorio va a sacar las gemas
# y cuales son esas gemas
# no olvides usar bundle install antes de ejecutar este código

# Para este ejemplo usaremos nokogiri, gema enfocada en manejo de html.
# Para obtener el html usaremos el restclient antes visto
require 'nokogiri'
require 'restclient'

# Con nokogiri obtendremos el articulo destacado de wikipedia
# primero obtenemos la pagina principal mediante un get del método get de nuestro restclient
# luego, convertimos ese texto html que recibimos a un objeto de Nokogiri
pagina_completa = Nokogiri::HTML(RestClient.get('https://es.wikipedia.org/wiki/Wikipedia:Portada'))

# ahora que tenemos la página completa, podemos obtener el elemento que queremos dentro de la página usando el método css
# en este caso, queremos el contenido del div con id main-tfa (que es donde esta el articulo destacado)
articulo_destacado = pagina_completa.css("div[id='main-tfa']")

# ahora, podemos continuar usando el método css para obtener elementos dentro del objeto ya obtenido
# en este caso, obtenemos el título del span con clase mw-headline (extraemos solo el texto asociado)
puts "\n\n#{articulo_destacado.css("span[class='mw-headline']").text}\n\n\n"

# y luego obtenemos el cuerpo del articulo que esta contenido en los parrafos p (obtenemos solo el texto asociado)
puts articulo_destacado.css("p").text

# Con eso, obtenemos una página y podemos manipular su contenido