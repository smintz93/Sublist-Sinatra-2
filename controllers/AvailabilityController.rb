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


	post "/players" do


		puts "----"
		puts  "this is the post availPlayer ROUTE"
		puts "----"

		puts @payload

		# payload is sending all of state over with just first one clicked. BUT has player id game id and available is correctly switched to true


		# available = Availability.new

		# # Need to update Availabilities table 
		# available.game_id = @payload[:game_id]
		# available.player_id = @payload[:player_id]
		# available.available = @payload[:available]
		# available.save

		##
		# for this to work like below the 8 games would need to be added to availibilities table?
		##

		## save 8 different availabilities. one for each game

		## do I need to change the table

		## Availability Create (2.2ms)  INSERT INTO "availabilities" ("available") VALUES ($1) RETURNING "id"  [["available", true]]
		## so not matter what happens its changing available on every game
		## this is happening 8 times  ^^^^^^^

		## does not look like anything is getting stored here in game and player id (binding.pry)
		## all avails have available set to true

		## if @payload[:game_id] comes back null is response

		## ANOTHER WAY TO DO THIS??

		avail1 = Availability.new
		avail1.game_id = @payload[:game1]
		avail1.player_id = @payload[:game1]
		avail1.available = @payload[:game1]
		avail1.save

		avail2 = Availability.new
		avail2.game_id = @payload[:game2]
		avail2.player_id = @payload[:game2]
		avail2.available = @payload[:game2]
		avail2.save

		avail3 = Availability.new
		avail3.game_id = @payload[:game3]
		avail3.player_id = @payload[:game3]
		avail3.available = @payload[:game3]
		avail3.save

		avail4 = Availability.new
		avail4.game_id = @payload[:game4]
		avail4.player_id = @payload[:game4]
		avail4.available = @payload[:game4]
		avail4.save

		avail5 = Availability.new
		avail5.game_id = @payload[:game5]
		avail5.player_id = @payload[:game5]
		avail5.available = @payload[:game5]
		avail5.save


		avail6 = Availability.new
		avail6.game_id = @payload[:game6]
		avail6.player_id = @payload[:game6]
		avail6.available = @payload[:game6]
		avail6.save


		avail7 = Availability.new
		avail7.game_id = @payload[:game7]
		avail7.player_id = @payload[:game7]
		avail7.available = @payload[:game7]
		avail7.save

         
		avail8 = Availability.new
		avail8.game_id = @payload[:game8]
		avail8.player_id = @payload[:game8]
		avail8.available = @payload[:game8]
		avail8.save

		# game id and player id is null right now 
		# available is true
	
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