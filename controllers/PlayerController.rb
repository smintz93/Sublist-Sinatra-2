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
	# and we want the checkboxes to be pre-populated based on database

	get '/:id/signedup' do


		# need to query availabilities table to see if player is in table 
		

		games = Game.all
		avails = Availability.where player_id: params[:id] # use where because it returns multiple games

		## what is avails
			# find by player id in the availability table 
			# how can I iterate over this if its not an array? -- fortunately .each appears to work


		# create a new array called availgames
		availgames = []


		games.each do |game|
			
			puts ""
			puts "here is the game we are about to work with"
			pp game
			puts ""

			# create a new empty hash new_game
			new_game = {}

			# make it have the same key value pairs as game
			game.attributes.each do |key, value|
				new_game[key] = value
			end	

			# plus, add an availability boolean based on whether game.id appears in avails or not

													
			it_is_there = false

			# loop over avails with .each if this game id is found set is it there to true

			avails.each do |a|
				puts "here is the availability we are currently on in avails.each loop"
				pp a

				if(game.id === a.game_id)
					it_is_there = true

				end	
			end	



			if it_is_there
				# set it to true
				new_game[:available] = true
			else 
				# set it to false
				new_game[:available] = false
			end

			availgames.push new_game

		end

		{
			success: true,
			message: "all games with signed up field added",
			availgames: availgames
		}.to_json
	end	


end	