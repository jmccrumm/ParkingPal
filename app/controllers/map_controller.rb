#Controls our map
class MapController < ApplicationController
	def index

	#@spots = Parkingspot.order("id ASC")

		@spotID = params[:postr].to_i

		if @spotID > 0 
			if Parkingspot.exists?(id: @spotID)
				@overlay = "overlayVisible"
				@spot = Parkingspot.find(@spotID)
				if @spot.occupying != nil
					@name = User.find(@spot.occupying).name
				else
					@name = ''
				end
				@status = @spot.status
				@type = @spot.spot_type
			end
		else 
			@overlay = "overlayHidden"
		end

		@parkingspots = Parkingspot.all
		@parkinglot = Parkinglot.find(1)
		@users = User.all

	end

	def spot
	end
end
