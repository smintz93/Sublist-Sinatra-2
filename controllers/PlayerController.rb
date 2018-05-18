class PlayerController < ApplicationController 

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

		puts "----"
		puts  "this is the post register ROUTE"
		puts "----"

		player = Player.new
		player.username = @payload[:username]
		player.password = @payload[:password]
		player.name = @payload[:name]
		player.pos = @payload[:pos]
		player.email = @payload[:email]
		player.phone = @payload[:phone]
		player.save

			session[:logged_in] = true
			session[:username] = player.username
			session[:player_id] = player.id

		# binding.pry
			
		{
			success: true,
			player_id: player.id,
			username: player.username,
			message: "This is the Register Player route"

		}.to_json
	
	end	

	post "/login" do

		username = @payload[:username]
		password = @payload[:password]

		player = Player.find_by username: username


		if player && player.authenticate(password)
				session[:logged_in] = true
				session[:username] = username
				session[:player_id] = player.id
			{
				success: true,
				player_id: player.id,
				username: username,
				message: "Login Successful"
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
		players = Player.all

			{  
				success: true,
				message: "You are hitting Player Controller",
				all_players: players
			}.to_json	

	end	

	get "/:id" do 
		players = Player.find params[:id]
		this_player_games = players.games

			{  
				success: true,
				message: "You are hitting Player Controller",
				games: this_player_games
			}.to_json	

	end	


end	