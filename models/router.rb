
# ROUTER: This file handles the menu.
# app.rb gives it an EXISTING Controller object.
# When the user chooses a number, the Router calls a Controller method.
# The Router does NOT create donuts or store them.

class Router # Blueprint for the menu.

  def initialize(controller) # Receive the Controller object from app.rb.
    @controller = controller # Remember that same Controller object.
  end # Finish initialize.

  def run # Start the application's menu.
    loop do # Keep showing the menu until the user exits.
      puts "WELCOME TO THE DONUT SHOP!" # Display the welcome message.
      puts "1. List donuts" # Offer the List action.
      puts "2. Add donut" # Offer the Add action.
      puts "3. Delete donut" # Offer the Delete action.
      puts "4. Sell donut" # Offer the Sell action.
      puts "5. Exit" # Offer a way to stop the program.

      choice = gets.chomp.to_i # Read the user's choice as a number.

      case choice # Check which menu option they chose.
      when 1 # They chose List.
        @controller.list # Ask the CONTROLLER to list donuts.
      when 2 # They chose Add.
        @controller.add # Ask the CONTROLLER to add a donut.
      when 3 # They chose Delete.
        @controller.delete # Ask the CONTROLLER to delete a donut.
      when 4 # They chose Sell.
        @controller.sell # Ask the CONTROLLER to sell a donut.
      when 5 # They chose Exit.
        break # Leave the loop and finish the program.
      else # Their choice wasn't on the menu.
        puts "Invalid choice!" # Tell them to try again.
      end # Finish checking the menu choice.
    end # Finish the menu loop.
  end # Finish run.
end # Finish the Router class.
