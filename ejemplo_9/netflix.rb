# Módulos

# Los modulos en ruby tienen 2 objetivos, el primero, encapsular funcionalidades para luego reutilizar código
# El segundo es organizar el sistema. Un modulo representa un ambiente de código con su propio espacio de funciones
# un modulo A puede tener una función funcion1 y otro módulo B puede tener otra función1 y ambas convivir sin problemas ya que pertenecen a ambientes distintos

# Este es un ejemplo del caso 1, crear un módulo para reutilizar código
# Un modulo puede contener constantes (se crean como cualquier variable pero con mayuscula)
# incluso puede agregar atributos a clases
# sin embargo, lo principal es añadir funcionalidades mediante métodos
module Reproducible
  # Por defecto en ruby todas las variables son privadas, al hacer esto estoy abriendo esta variable tanto de lectura como de escritura
  # si quisiera que fuese de solo lectura debería usar attr_reader (solo getter) o solo escritura attr_writer (solo setter)
  # recordemos que esto es para poder acceder a la variable desde fuera de la clase (no es recomendable a menos que sea estrictamente necesario)
  # En el fondo, esto crea un getter y un setter
  attr_accessor :reproduciendo

  def reproducir
    if !@reproduciendo
      puts "Comenzando a reproducir #{@titulo}"
      @reproduciendo = true
    else
      puts "#{@titulo} ya se estaba reproduciendo"
    end
  end

  def stop
    if @reproduciendo
      puts "Deteniendo #{@titulo}"
      @reproduciendo = false
    else
      puts "#{@titulo} ya se encontraba detenido"
    end
  end
end
# es importante destacar que el modulo NO es una clase
# no es posible crear objetos Reproducibles
# es importante notar que dentro del código existen 2 atributos.
# Estos atributos no pertenecen a Reproducible, solo existirán cuando este modulo se añada a una clase
# y formaran parte de los objetos de ese tipo

# La segunda razón para tener módulos es que separen ambientes
# En este caso el modulo Netflix tendrá todas las clases asociadas a este medio
# Es posible tener módulos dentro de otros módulos
module Netflix
  class Anime
    #los modulos se pueden incluir en una clase. Dicha clase adquiere todas las funcionalidades y variables del modulo
    include Reproducible

    def initialize titulo
      @titulo = titulo
    end
  end

  class Pelicula
    include Reproducible

    def initialize titulo
      @titulo = titulo
    end
  end
end

# Fuera del módulo, para hacer referencia a sus funciones miembro y clases, es necesario añadir como prefijo el nombre del modulo
# y, separado con (::) a lo que se hace referencia.
# En este caso, el modulo es Netflix y las clases Anime y Pelicula
anime1 = Netflix::Anime.new 'Tsubasa Reservoir Chronicle'
pelicula1 = Netflix::Pelicula.new 'El aro'

=begin
Como antes se mencionó, no es posible hacer objetos directamente del tipo del módulo
por tanto no es posible realizar las siguientes lineas porque no existe métido new para modulos

reproducible = Reproducible.new
reproducible.reproducir

offtopic, los comentarios de varias lineas se hacen usando =begin ... =end
=end

# Se puede ver que ambos objetos tienen el método reproducir
anime1.reproducir
pelicula1.reproducir

# Tambien tienen métido stop
anime1.stop

# Como podras ver al ejecutar, ambos tipos de datos, además de su clase, se considera que son miembros del módulo
# por lo que todas estas llamadas serían true
puts anime1.is_a? Netflix::Anime
puts anime1.is_a? Reproducible
puts pelicula1.is_a? Netflix::Pelicula
puts pelicula1.is_a? Reproducible

# Puedo acceder a las variables reproduciendo (en la clase son @reproduciendo)
puts anime1.reproduciendo
puts pelicula1.reproduciendo

# no sería posible acceder a las otras variables directamente usando, por ejemplo, anime1.titulo, esto porque esta fuera de la clase
# y esas variables son privadas.