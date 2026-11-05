
# APP.RB: This is where the whole application starts.
# It loads the classes, creates the objects, and connects them.
# It then tells the Router to start running.

require_relative "models/donut" # Load the MODEL blueprint.
require_relative "repositories/donut_repository" # Load the REPOSITORY blueprint.
require_relative "views/donuts_view" # Load the VIEW blueprint.
require_relative "controllers/donuts_controller" # Load the CONTROLLER blueprint.
require_relative "router" # Load the ROUTER blueprint.

# STEP 1: Create the Repository object.
repository = DonutRepository.new("data/donuts.csv") # The Repository will hold donuts and save them to this file.

# STEP 2: Create the Controller object.
controller = DonutsController.new(repository) # Give the Controller our EXISTING Repository object.

# STEP 3: Create the Router object.
router = Router.new(controller) # Give the Router our EXISTING Controller object.

# STEP 4: Start the application.
router.run # Tell the Router to display the menu and wait for choices.
