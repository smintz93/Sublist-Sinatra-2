class Game < ActiveRecord::Base
	
	# has_many :teams

	has_many :availabilities
	has_many :players, through: :availabilities

end