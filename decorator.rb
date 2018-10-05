# Intent
# Attach additional responsibilities to an object dynamically. Decorators
# provide a flexible alternative to subclassing for extending functionality.

class Coffee
  attr_accessor :price

  def price
    2.50
  end
end

class CoffeeWithCream
  def initialize(coffee)
    @coffee = coffee
  end

  def price
    @coffee.price += 0.50
  end
end

class CoffeeWithSugar
  def initialize(coffee)
    @coffee = coffee
  end

  def price
    @coffee.price += 0.25
  end

  def indeuce_suger_rush
    p 'sugar rush induced'
  end
end

coffee = Coffee.new
puts "Plain Coffee - #{coffee.price}"
coffee = CoffeeWithCream.new(Coffee.new)
puts "Coffee with Cream - #{coffee.price}"
coffee = CoffeeWithSugar.new(Coffee.new)
puts "Coffee with Sugar - #{coffee.price}"
