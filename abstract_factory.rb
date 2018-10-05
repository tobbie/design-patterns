# Intent
# Provide an interface for creating families of related or dependent objects
# without specifying their concrete class

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eat; end

  def speak; end
end

class Tiger < Animal

  def eat
    puts "Tiger #{name} eats meat"
  end

  def speak
    puts "Roar"
  end
end

class Habitat
  def initialize(organism_factory, number_of_animals: 0)
    @organism_factory = organism_factory
    @animals = []

    number_of_animals.times do |i|
      animal = @organism_factory.new_animal("Animal#{i}")
      @animals << animal
    end
  end

  def simulate_one_day
    @animals.each(&:speak)
    @animals.each(&:eat)
  end
end

class JungleOrganismFactory
  def new_animal(name)
    Tiger.new(name)
  end
end

jungle = Habitat.new(JungleOrganismFactory.new, number_of_animals: 2)
jungle.simulate_one_day
