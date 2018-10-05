# Intent
# Decouple an abstraction from its implementation so that the two can vary
# independently.

class Shape
  def initialize(implementor)
    @implementor = implementor
  end
end

class Rectangle < Shape
  def draw
    @implementor.draw_rectangle
  end
end

class ShapeImplementor
  def draw_rectangle
    raise "draw_rectangle() must be implemented"
  end
end

class Windows < ShapeImplementor
  def draw_rectangle
    p "drawing a rectangle on Windows"
  end
end

class MacOs < ShapeImplementor
  def draw_rectangle
    p "drawing a rectangle upon a Mac"
  end
end

rectangle = Rectangle.new(MacOs.new)
rectangle.draw
