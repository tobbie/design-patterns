# Intent
# Define an interface for createing an object but let subclasses decide which
# class to instantiate. Factory method lets a class defer instantiation to subclasses

class Shape
  def initialize(*args)
    puts "#{args}"
  end

  def draw
    raise NotImplementedError, "draw() must be defined"
  end
end

class Triangle < Shape
  def draw
    puts "drawing triangle"
  end
end

class Square < Shape
  def draw
    puts "drawing square"
  end
end

class Cirle < Shape
  def draw
    puts "drawing circle"
  end
end

class ShapeFactory
  def self.build(shape, *args)
    case shape
    when :triangle
      Triangle.new(*args)
    when :square
      Square.new(*args)
    else
      raise NotImplementedError, 'Shape not found'
    end
  end
end

triangle = ShapeFactory.build(:triangle, 2, 3, 4)
triangle.draw
square = ShapeFactory.build(:square, 4)
square.draw
circle = ShapeFactory.build(:circle, 3)
circle.draw