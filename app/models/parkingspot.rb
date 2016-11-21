#parking spot model
class Parkingspot < ActiveRecord::Base
	belongs_to :parkinglot
	has_one :user

	validates :status, presence: true
	validates :parkinglot_id, presence: true

	#validates :status, acceptance: {accept: ['TRUE', 'open','taken', 'reserved']}
	#validates :spot_type, acceptance: {accept: ['TRUE', 'handicap','normal']}

	if :occupying != nil
	#	validates_associated :user
	end
end
