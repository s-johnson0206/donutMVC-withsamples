
# REPOSITORY: This file keeps ALL the donuts.
# The Controller calls this file to add, find, or remove donuts.
# This file uses the Donut MODEL when loading saved donuts.

require "csv" # Load Ruby's CSV library so we can read and write CSV files.
require_relative "../models/donut" # Go up one folder, enter models, and load donut.rb.

class DonutRepository # Blueprint for our donut storage.

  def initialize(csv_file) # Receive the location of our CSV file.
    @csv_file = csv_file # Remember where the CSV file lives.
    @donuts = [] # Create an empty array to hold Donut objects.
    load_csv # Load previously saved donuts into the array.
  end # Finish initialize.

  def add(donut) # Receive ONE Donut object from the Controller.
    @donuts << donut # Put that donut inside the array.
    save_csv # Save the new list of donuts to the CSV file.
  end # Finish add.

  def all # Let the Controller ask for every donut.
    @donuts # Return the array of donuts.
  end # Finish all.

  def delete(index) # Receive the position of the donut to remove.
    @donuts.delete_at(index) # Remove the donut at that position.
    save_csv # Save the updated list to the CSV file.
  end # Finish delete.

  def load_csv # Read saved donut information from the CSV file.
    return unless File.exist?(@csv_file) # Stop if the CSV file doesn't exist yet.

    CSV.foreach(@csv_file, headers: true) do |row| # Read each saved row, one at a time.
      donut = Donut.new( # Use the MODEL to create a Donut object.
        name: row["name"], # Get the name from this CSV row.
        description: row["description"], # Get the description.
        price: row["price"].to_i, # Turn the saved price into an Integer.
        has_hole: row["has_hole"] == "true", # Turn the saved text into true or false.
        stock: row["stock"].to_i # Turn the saved stock into an Integer.
      ) # Finish creating this Donut object.

      @donuts << donut # Put the loaded Donut object into our array.
    end # Finish reading the rows.
  end # Finish load_csv.

  def save_csv # Write the donuts from memory into our CSV file.
    CSV.open(@csv_file, "wb") do |csv| # Open the file for writing.
      csv << ["name", "description", "price", "has_hole", "stock"] # Write column names.

      @donuts.each do |donut| # Visit every Donut object in our array.
        csv << [donut.name, donut.description, donut.price, donut.has_hole, donut.stock] # Read its attributes and save them as a row.
      end # Finish visiting donuts.
    end # Close the CSV file.
  end # Finish save_csv.
end # Finish the DonutRepository class.
