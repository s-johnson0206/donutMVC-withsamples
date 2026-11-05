
# VIEW: This file talks to the person using our app.
# The Controller asks this file to show or collect information.
# This file does NOT save donuts.

class DonutsView # Blueprint for the screen our user interacts with.

  def display_list(donuts) # Receive an array of donuts from the Controller.
    donuts.each_with_index do |donut, index| # Look at each donut and its position.
      puts "#{index + 1}. #{donut.name} - ¥#{donut.price} - Stock: #{donut.stock}" # Show one donut.
    end # Finish displaying the donuts.
  end # Finish display_list.

  def ask_for_name # Ask the user for the donut's name.
    puts "What is the donut's name?" # Show the question.
    gets.chomp # Read their answer and remove the Enter character.
  end # Finish ask_for_name.

  def ask_for_description # Ask the user for a description.
    puts "Describe the donut:" # Show the question.
    gets.chomp # Return what the user typed.
  end # Finish ask_for_description.

  def ask_for_price # Ask the user for the price.
    puts "How much does it cost?" # Show the question.
    gets.chomp.to_i # Convert the typed answer into an Integer.
  end # Finish ask_for_price.

  def ask_for_hole # Ask if the donut has a hole.
    puts "Does it have a hole? (yes/no)" # Show the question.
    gets.chomp.downcase == "yes" # Return true for yes and false otherwise.
  end # Finish ask_for_hole.

  def ask_for_stock # Ask how many donuts are available.
    puts "How many are in stock?" # Show the question.
    gets.chomp.to_i # Return the answer as an Integer.
  end # Finish ask_for_stock.

  def ask_for_index # Ask the user to select a donut.
    puts "Which donut number?" # Show the question.
    gets.chomp.to_i - 1 # Change human numbering (1, 2) into array positions (0, 1).
  end # Finish ask_for_index.

  def ask_for_quantity # Ask how many donuts the user wants.
    puts "How many donuts?" # Show the question.
    gets.chomp.to_i # Return the amount as an Integer.
  end # Finish ask_for_quantity.

  def display_message(message) # Receive some text from the Controller.
    puts message # Show the text in the Terminal.
  end # Finish display_message.
end # Finish the DonutsView class.
