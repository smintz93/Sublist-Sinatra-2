class Team < ActiveRecord::Base


	has_many :players, through: :availabilities
 	has_many :games

 	has_secure_password


end
