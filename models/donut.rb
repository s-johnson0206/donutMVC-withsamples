# MODEL: This file describes ONE donut.
# The Repository will store many Donut objects.
# The Controller will create Donut objects when needed.

class Donut # This is the blueprint for making a donut.

  # These let other files READ the donut's information.
  attr_reader :name, :description, :stock, :has_hole

  # This lets other files READ and CHANGE the price.
  attr_accessor :price

  # .new calls initialize when we create a Donut object.
  def initialize(attributes = {}) # Receive a Hash containing donut information.
    @name = attributes[:name] # Remember the donut's name.
    @description = attributes[:description] # Remember its description.
    @price = attributes[:price] # Remember its price.
    @has_hole = attributes[:has_hole] # Remember if it has a hole.
    @stock = attributes[:stock] # Remember how many donuts we have.
  end # Finish initialize.

  def hole? # Ask: Does this donut have a hole?
    @has_hole # Return true or false.
  end # Finish hole?.

  def out_of_stock? # Ask: Are there zero donuts left?
    @stock == 0 # Return true if stock is zero.
  end # Finish out_of_stock?.

  def sell(quantity) # Receive how many donuts someone wants to buy.
    raise "Invalid quantity!" if quantity <= 0 # Don't allow zero or negative amounts.
    raise "Not enough donuts in stock!" if @stock < quantity # Don't sell more than we have.
    @stock -= quantity # Subtract the purchased amount from stock.
  end # Finish sell.
end # Finish the Donut class.
