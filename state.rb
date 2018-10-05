# Intent
# Allow an object to alter its behaviour when its internal state changes.
# The object will appear to change its class.

class Context
  def initialize(item)
    @state = item
  end

  def set_state(value)
    @state = value
    puts "Inside Context"
  end

  def get_state
    @state
  end

  def request
    @state.handle(self)
  end
end

class ConcreteStateA 
  def handle(context)
    puts "Handling ConcreteStateA"
    context.set_state(ConcreteStateB.new)
  end
end

class ConcreteStateB 
  def handle(context)
    puts "Handling ConcreteStateB"
    context.set_state(ConcreteStateA.new)
  end
end

state = ConcreteStateA.new
context = Context.new(state)

context.request
context.request