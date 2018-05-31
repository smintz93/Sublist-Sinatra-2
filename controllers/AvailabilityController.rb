class AvailabilityController < ApplicationController 

	## one route that adds availability and one that deletes
	## test with postman 
	## hit the correct route when someone clicks a check.

	## update state once you hear back from db. 


	# Json Body Filter 

	before do 
		payload_body = request.body.read
		if(payload_body != "")
			@payload = JSON.parse(payload_body).symbolize_keys

			puts "-----------------------  HERE IS Payload"
			pp @payload
			puts "----------------------- HERE IS Payload"
		end
	end

	get "/" do
		{  
			success: true,
			message: "You are hitting available Controller"
		}.to_json

	end 

	get "/players" do

		# binding.pry
		# available_players = Availability.where(player_id: player_id)


		{  
			success: true,
			message: "You are hitting looking at all the available Players",
			players: available_players
		}.to_json

	end 


	get "/games/players/:id" do 
		game = Game.find params[:id]

		available_players_game = game.players

		{
			success: true,
			message: "These players are available for game #{game.id}",
			players: available_players_game
		}.to_json
	end	

	put "/players" do

		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		# available = Availability.find params[:id]

		player = Availability.where(player_id: player_id, game_id: game_id)

		{
			success: true,
			message: "this is the put route",
			edited_player: player
		}.to_json

	end	

	## adding availibility
	post "/players" do

		puts "----"
		puts  "this is the post availPlayer ROUTE"
		puts "----"

		puts @payload

		available = Availability.new
		available.game_id = @payload[:game_id]
		available.player_id = @payload[:player_id]
		available.save

		# payload is sending all of state over with just first one clicked. BUT has player id game id and available is correctly switched to true

		# game1 = @payload[:game1].symbolize_keys
		# avail1 = Availability.new
		# avail1.game_id = game1[:game_id]
		# avail1.player_id = game1[:player_id]
		# avail1.available = game1[:available]
		# avail1.save

		# # binding.pry
	
		# # the response for each game changes avail to true
		{
			success: true,
			available: available,
			message: "This is available/players route in availabilityController"
		}.to_json

	end	

	# remove availability  
	delete '/players/:id' do

		available = Availability.find(params[:id])
		# available = Availability.where([player_id = session[:player_id], game_id = :game_id])
		available.destroy

		{
			success: true,
			available: available,
			message: "remove availability route"
		}.to_json

	end	

	post "/games/players/:id" do 

		game = Game.find params[:id]


		available_players_game = game.players

		{
			success: true,
			message: "These players are available for game #{game.id}",
			players: available_players_game
		}.to_json
	end	


	get "/games" do

		games = Game.all
		
		{  
			success: true,
			message: "You are hitting available Controller",
			games: games
		}.to_json

	end 



end	