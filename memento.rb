# Intent
# Without violating encapsulation, capture and externalize an object’s internal
# state so that the object can be restored to this state later.

class Memento
  attr_reader :state

  def initialize(state)
    @state = state
  end
end

class Originator
  attr_accessor :state

  def initialize
    @state = ""
  end

  def save_to_memento
    Memento.new(@state)
  end

  def restore_from_memento(memento)
    puts "Restored back to previous state"
    @state = memento.state
  end
end

class Caretaker
  attr_accessor :memento
end

caretaker = Caretaker.new
originator = Originator.new

originator.state = "name:foo"
memento = originator.save_to_memento
caretaker.memento = memento
originator.state = "name:bar"
originator.restore_from_memento(caretaker.memento)
