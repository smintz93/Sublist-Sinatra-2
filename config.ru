require 'sinatra/base'

require 'sinatra/activerecord'


# Controllers 
require './controllers/ApplicationController'
require './controllers/GameController'
require './controllers/PlayerController'
require './controllers/TeamController'
require './controllers/AvailabilityController'


# Models

require './models/AvailabilityModel'
require './models/GameModel'
require './models/PlayerModel'
require './models/TeamModel'

# Routes

map('/') {
	run ApplicationController
}

map('/games') {
	run GameController
}

map('/player') {
	run PlayerController
}
map('/available') {
	run AvailabilityController
}

map('/team') {
	run TeamController
}




