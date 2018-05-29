class AvailabilityController < ApplicationController 


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

		available_players = Availability.where(available: true)


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


	post "/players" do

		puts "----"
		puts  "this is the post availPlayer ROUTE"
		puts "----"

		puts @payload

		# payload is sending all of state over with just first one clicked. BUT has player id game id and available is correctly switched to true

		# for this to work like below the 8 games would need to be added to availibilities table?
		##

		## save 8 different availabilities. one for each game

		## does not look like anything is getting stored here in game and player id (binding.pry)
		## all avails have available set to true

		## if @payload[:game_id] comes back null is response
		## avail1.???? what comes after
		## Does it have to be whatever I have in my table??

		game1 = @payload[:game1].symbolize_keys
		avail1 = Availability.new
		avail1.game_id = game1[:game_id]
		avail1.player_id = game1[:player_id]
		avail1.available = game1[:available]
		avail1.save

		game2 = @payload[:game2].symbolize_keys
		avail2 = Availability.new
		avail2.game_id = game2[:game_id]
		avail2.player_id = game2[:player_id]
		avail2.available = game2[:available]
		avail2.save

		game3 = @payload[:game3].symbolize_keys
		avail3 = Availability.new
		avail3.game_id = game3[:game_id]
		avail3.player_id = game3[:player_id]
		avail3.available = game3[:available]
		avail3.save

		game4 = @payload[:game4].symbolize_keys
		avail4 = Availability.new
		avail4.game_id = game4[:game_id]
		avail4.player_id = game4[:player_id]
		avail4.available = game4[:available]
		avail4.save

		game5 = @payload[:game5].symbolize_keys
		avail5 = Availability.new
		avail5.game_id = game5[:game_id]
		avail5.player_id = game5[:player_id]
		avail5.available = game5[:available]
		avail5.save


		game6 = @payload[:game6].symbolize_keys
		avail6 = Availability.new
		avail6.game_id = game6[:game_id]
		avail6.player_id = game6[:player_id]
		avail6.available = game6[:available]
		avail6.save

		game7 = @payload[:game7].symbolize_keys
		avail7 = Availability.new
		avail7.game_id = game7[:game_id]
		avail7.player_id = game7[:player_id]
		avail7.available = game7[:available]
		avail7.save

       	game8 = @payload[:game8].symbolize_keys
		avail8 = Availability.new
		avail8.game_id = game8[:game_id]
		avail8.player_id = game8[:player_id]
		avail8.available = game8[:available]
		avail8.save
		# game id and player id is null right now 
		# available is true

		# binding.pry
	
		# the response for each game changes avail to true
		{
			success: true,
			game1: avail1,
			game2: avail2,
			game3: avail3,
			game4: avail4,
			game5: avail5,
			game6: avail6,
			game7: avail7,
			game8: avail8,
			message: "This is available/players route in availabilityController"
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