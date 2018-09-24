# Intent
# Define a family of algorithms, encapsulate each one, and make them
# interchangeable. Strategy lets the algorithm vary independently from clients
# that use it.

class Car
  def initialize(engine)
    @engine = engine
  end

  def start
    @engine.start
  end

  def stop
    @engine.stop
  end
end

class StraightSixEngine
  def start
    puts "Start Straight Six Engine"
  end

  def stop
    puts "Stop Straight Six Engine"
  end
end

class V8Engine
  def start
    puts "Start V8 Engine"
  end
  
  def stop
    puts "Stop V8 Engine"
  end
end

car_a = Car.new(StraightSixEngine.new)
car_b = Car.new(V8Engine.new)

car_a.start
car_a.stop
car_b.start