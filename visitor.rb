# Intent
# Represent an operation to be performed on the elements of an object structure.
# Visitor lets you define a new operation without changing the classes of the 
# elements on which it operates.

module Visitable
  def accept(visitor)
    visitor.visit(self)
  end
end

class Product
  include Visitable

  attr_reader :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end
end

class Order
  include Visitable

  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def accept(visitor)
    @products.each do |product|
      product.accept(visitor)
    end
  end
end

class Visitor
  def visit(subject)
    raise NotImpelementedError.new
  end
end

class ProductsPrinterVisitor < Visitor
  def visit(subject)
    puts "Product: #{subject.name} - $#{subject.price}"
  end
end

class HalfPriceSimulatorVisitor < Visitor
  def visit(subject)
    puts "Product: #{subject.name} - after 50% discount: $#{subject.price / 2.0}"
  end
end

p1 = Product.new(name: 'Laptop', price: 1000)
p2 = Product.new(name: 'Beer', price: 5)
order = Order.new
order.add_product(p1)
order.add_product(p2)
order.accept(ProductsPrinterVisitor.new)
order.accept(HalfPriceSimulatorVisitor.new)
