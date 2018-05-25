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

		player = Player.find_by({:username => username})


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
		player = Player.find params[:id]
		this_player_games = player.games

			{  
				success: true,
				message: "You are hitting Player Controller",
				games: this_player_games
			}.to_json	

	end	



	# send back array of all games with a boolean attached indicating whter or not this player is aavailable for game
	# we need to do this because the games database does not currently contain availability boolean for a  particular player
	# get '/:id/signedup' do
	# 	# player = Player.find params[:id]
	# 	# this_player_games = player.games

	# 	# need to query availabilities table to see if player is in table 
		

	# 	games = Game.all
	# 	avails = Availability.find_by player_id: params[:id]

	# 	# create a new array called availgames
	# 	availgames = []

	# 	# binding.pry

	# 	games.each do |game|

	# 		# create a new empty hash new_game

	# 		new_game = {}

	# 		# make it have the same key value pairs as game

	# 		game.attributes.each do |key, value|
	# 			new_game[:key] = value
	# 		end	

	# 		# set the availability boolean based on avails

	# 			# if game.id appears in avails 
	# 			# array_of_hashes.any? {|h| h[:a] == 11}
	# 			# if avails.any? {|g| g[:game_id] == game.id}
	# 			# includes?
	# 			# if this changes to availgames then
	# 			if avails.include?(game.id)
	# 			# if(game.id) === avails
	# 				# set it to true
	# 				new_game[:available] = true
	# 			else 
	# 				# set it to false
	# 				new_game[:available] = false
	# 			#

	# 			end

	# 		availgames.push new_game

	# 	end


	# 	# binding.pry

	# 	{
	# 		success: true,
	# 		message: "all games with signed up field added",
	# 		availgames: availgames
	# 	}.to_json
	# end	


end	