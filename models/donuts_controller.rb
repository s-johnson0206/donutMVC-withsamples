
# CONTROLLER: This file connects the MODEL, VIEW, and REPOSITORY.
# The Router calls this Controller when the user selects an action.
# The Controller asks the View for input.
# It creates Donut objects and asks the Repository to store them.

require_relative "../models/donut" # Load the Donut class.
require_relative "../views/donuts_view" # Load the DonutsView class.

class DonutsController # Blueprint for handling donut actions.

  def initialize(repository) # Receive an EXISTING Repository object from app.rb.
    @repository = repository # Remember that same Repository object.
    @view = DonutsView.new # Create a View object to talk to the user.
  end # Finish initialize.

  def list # Called by the Router when the user chooses List.
    donuts = @repository.all # Ask the REPOSITORY for all the Donut objects.
    @view.display_list(donuts) # Give those donuts to the VIEW for display.
  end # Finish list.

  def add # Called by the Router when the user chooses Add.
    name = @view.ask_for_name # Ask the VIEW to collect a name.
    description = @view.ask_for_description # Ask the VIEW for a description.
    price = @view.ask_for_price # Ask the VIEW for a price.
    has_hole = @view.ask_for_hole # Ask the VIEW whether it has a hole.
    stock = @view.ask_for_stock # Ask the VIEW how many we have.

    donut = Donut.new( # Ask the MODEL to create ONE new Donut object.
      name: name, # Give the new Donut its name.
      description: description, # Give it its description.
      price: price, # Give it its price.
      has_hole: has_hole, # Tell it whether it has a hole.
      stock: stock # Give it its starting stock.
    ) # Finish creating the donut.

    @repository.add(donut) # Ask the REPOSITORY to store the new Donut object.
    @view.display_message("Donut added!") # Ask the VIEW to show a success message.
  end # Finish add.

  def delete # Called by the Router when the user chooses Delete.
    list # Show the donuts first so the user knows their numbers.
    index = @view.ask_for_index # Ask the VIEW which donut to remove.
    @repository.delete(index) # Ask the REPOSITORY to delete that donut.
    @view.display_message("Donut deleted!") # Show a message to the user.
  end # Finish delete.

  def sell # Called by the Router when the user chooses Sell.
    list # Show which donuts are available.
    index = @view.ask_for_index # Ask which donut the person wants.
    quantity = @view.ask_for_quantity # Ask how many they want.

    donut = @repository.all[index] # Get the selected Donut object from the Repository.
    return @view.display_message("Donut not found!") unless donut # Stop if that donut doesn't exist.

    begin # Start a section where we can handle a selling error.
      donut.sell(quantity) # Ask the MODEL to reduce its own stock.
      @repository.save_csv # Ask the REPOSITORY to save that stock change.
      @view.display_message("Donuts sold!") # Ask the VIEW to show success.
    rescue RuntimeError => error # Catch an error such as not enough stock.
      @view.display_message(error.message) # Ask the VIEW to display the error.
    end # Finish handling the sale.
  end # Finish sell.
end # Finish the DonutsController class.
