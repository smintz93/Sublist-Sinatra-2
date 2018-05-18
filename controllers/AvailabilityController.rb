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