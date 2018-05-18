class TeamController < ApplicationController 

	before do 
		payload_body = request.body.read
		if(payload_body != "")
			@payload = JSON.parse(payload_body).symbolize_keys

			puts "-----------------------  HERE IS Payload"
			pp @payload
			puts "----------------------- HERE IS Payload"
		end
	end	


	post "/register" do
		team = Team.new
		team.username = @payload[:username]
		team.password = @payload[:password]
		team.save

			session[:logged_in] = true
			session[:username] = team.username
			session[:team_id] = team.id

			{
				success: true,
				team_id: team.id,
				username: team.username,
				message: "This is register for team rep"
			}.to_json
	end	

	post "/login" do 
		username = @payload[:username]
		password = @payload[:password]

		team = Team.find_by username: username

		if team && team.authenticate(password)
			session[:logged_in] = true
			session[:username] = username
			session[:team_id] = team.id
			{
				success: true,
				team_id: team.id,
				username: username,
				message: "This is the Login route for player. Login Succesful"
			}.to_json

		else
			{
				success: false,
				message: "Invalid username or password"
			}.to_json
		end	
	end	



	get "/logout" do
		session.destroy
		{
			success: true,
			message: "you are now logged out, goodbye"
		}.to_json
	end




	get "/" do 
		teams = Team.all
		{  
			success: true,
			message: "You are hitting Team Controller ",
			teams: teams
		}.to_json	

	end	
	# display all the games for this team
	get "/:id" do 
		team = Team.find params[:id]
		binding.pry
		this_team_games = team.games
		{  
			success: true,
			message: "You are hitting Team Controller",
			games: this_team_games
		}.to_json	
	end

	get "/players" do 

		players = Players.all params[:id]
		players = players.games
		{  
			success: true,
			message: "You are hitting Team Controller",
			players: players
		}.to_json	
	end

		

end	