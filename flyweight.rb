# Intent
# Use sharing to support large numbers of fine-grained objects efficiently

class Flyweight
  def operation(extrinsic_state)
    raise NotImplementedError, "operation must be defined in subclass"
  end
end

class ConcreteFlyweight < Flyweight
  def initialize(key)
    if key == "flyweight1"
      @intrinsic_state = 101
    elsif key == "flyweight2"
      @intrinsic_state = 102
    elsif key == "flyweight 3"
      @intrinsic_state = 103
    end
  end

  def operation(extrinsic_state)
    puts "Inside ConcreteFlyweight operation"
    puts "Intrinsic State = #{@intrinsic_state}"
    puts "Extrinsic State = #{extrinsic_state}"
  end
end

class UnsharedConcreteFlyweight < Flyweight
  def initialize(value)
    @all_state = value
  end

  def operation(extrinsic_state)
    puts "Inside UnsharedConcreteFlyweight operation"
    puts "All State = #{@all_state}, Extrinsic State = #{extrinsic_state}"
  end
end

class FlyweightFactory
  def initialize
    @flyweight_pool = Hash.new
  end

  def get_flyweight(key)
    if @flyweight_pool.has_key? key
      puts "Flyweight from existing pool"
      return @flyweight_pool[key]
    else
      item = ConcreteFlyweight.new(key)
      @flyweight_pool[key] = item
      puts "New Flyweight in pool"
      return item
    end
  end
end

flyweight_factory = FlyweightFactory.new

flyweight1 = flyweight_factory.get_flyweight("flyweight1")
flyweight1.operation(10)

flyweight2 = flyweight_factory.get_flyweight("flyweight1")
flyweight2.operation(20)
  