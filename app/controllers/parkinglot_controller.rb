class ParkinglotController < ApplicationController
	def	index
		@parkingspots = Parkingspot.all
		@parkinglot = Parkinglot.find(1)
		@users = User.all
		@uname = []
		@users.each do |u|
			@uname << u.name
		end
	end
end
