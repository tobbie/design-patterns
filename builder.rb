# Intent
# Seperate the construction of a complex object from its representation so that
# the same construction process can create different representations.
# A builder class is primarily intent on configuring an object

class GuitarBuilder
  attr_reader :guitar

  def initialize
    @guitar = Guitar.new
  end

  def guitar
    raise "Too few strings" if @guitar.number_of_strings < 4
    raise "Too many strings" if @guitar.number_of_strings > 8
    raise "Improper body" if @guitar.body.width > 32 || @guitar.body.depth > 12
    @guitar
  end

  def place_strings(number)
    @guitar.build_strings(number)
  end

  def craft_body(depth, width)
    @guitar.body = GuitarBody.new(depth, width)
  end

  def paint_body(color)
    @guitar.body.color = color
  end
end

class Guitar
  attr_accessor :body, :strings

  def initialize
    @strings = []
  end

  def number_of_strings
    @strings.length
  end

  def build_strings(number)
    number.times do
      @strings.push GuitarString.new
    end
  end
end

class GuitarString
  attr_accessor :length
end

class GuitarBody
  attr_reader :depth, :width
  attr_accessor :color

  def initialize(depth, width)
    @depth = depth
    @width = width
  end
end

guitar_builder = GuitarBuilder.new
guitar_builder.place_strings(6)
guitar_builder.craft_body(12, 24)
guitar_builder.paint_body("orange")
guitar = guitar_builder.guitar

p guitar.body
p guitar.number_of_strings
