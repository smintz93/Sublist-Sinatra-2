class GameController < ApplicationController 


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
		games = Game.all 

		{  
			success: true,
			message: "You are hitting Game Controller",
			all_games: games
		}.to_json	

	end	

	get "/:id" do
		# Getting all games for whichever team name you want to enter
		team = Team.find params[:id]
		# binding.pry
		this_team_games = team.games
		{
			success: true,
			message: "Games for team #{team.team_name}",
			team_games: this_team_games
		}.to_json

	end	





end	