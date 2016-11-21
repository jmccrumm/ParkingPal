#parking lot stuff
class ParkinglotController < ApplicationController
	def	index
		@parkingspots = Parkingspot.order("id ASC")
		@parkinglot = Parkinglot.find(1)
	end
end
