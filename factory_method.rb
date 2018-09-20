class Shape
  def initialize(*args)
    puts "\n #{args}"
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