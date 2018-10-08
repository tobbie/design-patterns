# Intent
# Define the skeleton of an algorithm in an operation, deferring some steps to
# subclasses. Template Method lets subclasses redefine certain steps of an
# algorithm without changing the algorithm’s structure.

class CarBuilder
  def build_car
    assemble_body
    add_wheel
    add_tires
    add_engine
    add_windows
    add_seats
    paint_car
  end
  
  def add_engine
    raise "Called abstract method: output_start"
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

class OmegaCarBuilder < CarBuilder
  def add_engine
    @engine = StraightSixEngine.new
  end

  def start_engine
    @engine.start
  end
end

car = OmegaCarBuilder.new
car.add_engine
car.start_engine