class ParkingspotController < ApplicationController
	def index
		id = params[:id] || 1
		@spot = Parkingspot.find(id)
		@user = current_user
		render(partial: 'spot', object: @spot) if request.xhr?
	end
	
	def take 
		flash[:success] = "Successfully taken the spot";
		flash[:failure] = "Failed to take the spot";

		redirect_to parkinglot_path
	end

	def reserve
		flash[:success] = "Successfully reserved the spot";
		flash[:failure] = "Failed to reserve the spot";

		redirect_to parkinglot_path
	end

	def leave
		flash[:success] = "Successfully left the spot";
		flash[:failure] = "Failed to leave the spot";

		redirect_to parkinglot_path
	end

	def cancel
		flash[:success] = "Successfully canceled your reservation";
		flash[:failure] = "Failed to cancel your reservation";

		redirect_to parkinglot_path
	end

end
