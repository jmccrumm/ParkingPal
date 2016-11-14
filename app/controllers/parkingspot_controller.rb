class ParkingspotController < ApplicationController
	def index
		id = params[:id] || 1
		@spot = Parkingspot.find(id)
		@user = current_user
		if @spot.occupying != nil
			session[:recipient] = User.find(@spot.occupying).email
		end
		render(partial: 'spot', object: @spot) if request.xhr?
	end
	
	def update
		purpose = params[:purpose].to_i || -1
		spot_id = params[:spot_id].to_i || -1
		user_id = params[:user_id].to_i || -1

		if spot_id > 0 && user_id > 0
			@spot = Parkingspot.find(spot_id)
			@user = User.find(user_id)
		end

		case purpose
			when 1
				@spot.status = 'taken'
				@spot.occupying = @user.id
				@user.is_parked = true

				flash[:success] = "Successfully taken the spot";
				#flash[:failure] = "Failed to take the spot";
			when 2
				@spot.status = 'reserved'
				@spot.occupying = @user.id
				@user.is_parked = true
				# add code to start 5 min countdown for reservation

				flash[:success] = "Successfully reserved the spot";
				#flash[:failure] = "Failed to reserve the spot";

			when 3
				@spot.status = 'open'
				@spot.occupying = nil
				@user.is_parked = false

				flash[:success] = "Successfully left the spot";
				#flash[:failure] = "Failed to leave the spot";

			when 4
				@spot.status = 'open'
				@spot.occupying = nil
				@user.is_parked = false
		
				flash[:success] = "Successfully canceled your reservation";
				#flash[:failure] = "Failed to cancel your reservation";

			else
				flash[:failure] = "Unknown Error";
		end


		if spot_id > 0 && user_id > 0
			@spot.save!
			@user.save!
		end

		redirect_to parkinglot_path
	end


end
