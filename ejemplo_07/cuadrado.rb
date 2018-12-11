# Clases y objetos

# las clases se definen usando la palabra class y el nombre con mayuscula
class Cuadrado
  # esta es una variable de clase (no de instancia), es decir, es la misma para todos los objetos de la clase.
  # se identifican por el @@
  # son como las variables estaticas en java
  @@cuadrados_creados = 0

  # el método constructor se llama initialize
  def initialize lado
    # los atributos (o varibales de instancia) se definen con @ antes del nombre y, al igual que las otras variables, no tienen que ser declarados
    # cada objeto tiene su propia copia de esta variable
    # estos atributos son privados por defecto
    @lado = lado
    # Acá se aumenta el valor de la variable de clase (es la misma para todas las instancias)
    @@cuadrados_creados += 1
  end

  # en ruby no es necesario usar la palabra return para retornar un valor, todos los metodos y funciones retornan el valor de su última linea
  def area
    # esto entrega lado al cuadrado
    @lado**2
  end

  def perimetro
    @lado*4
  end

  # este es un método de la clase
  # en estos métidos solo se pueden usar variables locales o de clase, no de instancia
  # esto es porque no serán usados por un objeto, sino llamados directamente usando la clase
  def self.cantidad_de_cuadrados
    @@cuadrados_creados
  end
end

# Aca se esta creando un objeto usando el metodo constructor (mediante la palabra reservada new con la sintaxis Clase.new)
# Son 2 objetos diferentes, cada uno tiene su propia copia de sus atributos
cuadrado1 = Cuadrado.new 5
cuadrado2 = Cuadrado.new 2

# en todos estos casos se esta usando un metodo de instancia usando objeto.metodo
puts "area cuadrado 1 = #{cuadrado1.area}"
puts "area cuadrado 2 = #{cuadrado2.area}"
puts "perimetro cuadrado 1 = #{cuadrado1.perimetro}"
puts "perimetro cuadrado 2 = #{cuadrado2.perimetro}"
# Como se puede ver, aca se esta usando un método de clase usando la sintaxis Clase.metodo
puts "cantidad de cuadrados creados: #{Cuadrado.cantidad_de_cuadrados}"
