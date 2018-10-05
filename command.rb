# Intent
# Encapsulate a request as an object, thereby letting you parameterize clients
# with different requests, queue or log requests, and support undoable operations.

class UIButton
  attr_reader :coomand

  def initialize(command)
    @command = command
  end

  def press_button
    puts "Button pressed"
    @command.execute
  end
end

class AddItemToCartCommand
  attr_reader :item, :cart

  def initialize(item, cart)
    @item = item
    @cart = cart
  end

  def execute
    puts "Adding to cart"
    @cart.add_item(@item)
  end

  def unexecute
    puts "Removing from cart"
    @cart.remove_item(@item)
  end
end

class Item
  def initialize(name)
    @name = name
  end
end

class Cart
  def self.get_current_cart
    Cart.new
  end

  def add_item(item)
    puts "Item added"
  end

  def remove_item(item)
    puts "Item removed"
  end
end

item = Item.new("Book")
cart = Cart.get_current_cart

command = AddItemToCartCommand.new(item, cart)
button = UIButton.new(command)
button.press_button
