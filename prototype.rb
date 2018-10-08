# Intent
# Specify the kinds of objects to create using a prototypical instance, and
# create new objects by copying this prototype.


class PizzaPrototype 

  def _clone
    return self.clone
  end

  def pizza_type(menu)
    case menu
    when :pepperoni
      Pizza.new('Pepperoni Pizza', ['pepperoni', 'shredded cheese'])
    else
      Pizza.new('Cheese Pizza', ['cheese'])
    end
  end
end

class Pizza
  def initialize(*args)
    @name = args[0]
    @ingredients = args[1..5]
    puts @name, @ingredients
  end
end

pizza_proto = PizzaPrototype.new
pizza = pizza_proto._clone
pizza.pizza_type(:pepperoni)