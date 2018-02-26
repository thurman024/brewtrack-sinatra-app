require './config/environment'

use Rack::MethodOverride
use BeerController
use BreweryController
use StyleController
run ApplicationController
