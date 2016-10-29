class ParkingspotController < ApplicationController
	def index
		id = params[:id] || 1
		@spot = Parkingspot.find(id)
		@user = current_user
		render(partial: 'spot', object: @spot) if request.xhr?
	end
end
