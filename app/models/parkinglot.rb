#parking lot model
class Parkinglot < ActiveRecord::Base
	has_many :parkingspots
end
