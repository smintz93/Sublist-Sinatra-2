class Player < ActiveRecord::Base

	has_many :availabilities
	has_many :games, through: :availabilities

	has_secure_password
 	

 	# has_many :teams, through: :availabilities



end
