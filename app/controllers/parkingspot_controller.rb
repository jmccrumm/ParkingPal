class ParkingspotController < ApplicationController
	def index
		id = params[:id] || 1
		@spot = Parkingspot.find(id)
		@user = current_user
		render(partial: 'spot', object: @spot) if request.xhr?
	end
	
	def take 
		spot_id = params[:spot_id] || 1
		user_id = params[:user_id] || 1
		@spot = Parkingspot.find(spot_id)
		@user = User.find(user_id)

		@spot.status = 'taken'
		@spot.occupying = @user.id
		@user.is_parked = true

		redirect_to parkinglot_path
	end

	def reserve
		spot_id = params[:spot_id] || 1
		user_id = params[:user_id] || 1
		@spot = Parkingspot.find(spot_id)
		@user = User.find(user_id)

		@spot.status = 'reserved'
		@spot.occupying = @user.id
		@user.is_parked = true
		# add code to start 5 min countdown for reservation

		redirect_to parkinglot_path
	end

	def leave
		spot_id = params[:spot_id] || 1
		user_id = params[:user_id] || 1
		@spot = Parkingspot.find(spot_id)
		@user = User.find(user_id)

		@spot.status = 'open'
		@spot.occupying = nil
		@user.is_parked = false

		redirect_to parkinglot_path
	end

	def cancel

		redirect_to stats_path
	end

end
