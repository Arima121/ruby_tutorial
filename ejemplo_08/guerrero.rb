# Herencia

# La clase guerrero será una versión básica de un personaje
class Guerrero
  def initialize poder, nombre
    @poder = poder
    @nombre = nombre
  end

  def atacar
    puts "#{@nombre} realiza un ataque de #{@poder} de fuerza"
  end
end

# La herencia en ruby se marca con el simbolo <. Esto significa Espadachin hereda de Guerrero
class Espadachin < Guerrero
  # Cuando se quiere crear un constructor en una clase hija no es obligatorio llamar al constructor del padre
  # Sin embargo, es posible hacerlo con la palabra super
  def initialize poder, nombre, arma
    # En este contexto super se refiere al constructor de la clase padre
    super poder*2, nombre
    @arma = arma
  end

  # Es posible sobre escribir métodos en las clases hijas e incluso llamar al metodo de la clase padre usando
  # super dentro de este nuevo método (no es obligatorio, solo posible)
  def atacar
    # En este contexto, super se refiere al metodo atacar de la clase padre
    super
    puts "Usó el poder de su arma #{@arma}"
  end
end

nuevo_espadachin = Espadachin.new 10, 'Rey Arturo', 'Excálibur'
# Podremos ver que la ejecución de atacar usa el metodo de la clase hija Espadachin
nuevo_espadachin.atacar

# Podemos corroborar que nuestro objeto tiene ambas clases usando el método is_a? que retorna true en caso de que
# el objeto que lo usa sea de la clase indicada
# Evidentemente el último debería dar false porque no es un string
puts nuevo_espadachin.is_a? Espadachin
puts nuevo_espadachin.is_a? Guerrero
puts nuevo_espadachin.is_a? String