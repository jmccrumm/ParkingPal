class Parkingspot < ActiveRecord::Base
	belongs_to :parkinglot
	has_one :user

	validates :status, presence: true
	validates :parkinglot_id, presence: true

	validates :status, acceptance: {accept: ['open','taken', 'reserved']}
	validates :spot_type, acceptance: {accept: ['handicap','normal']}

	if :occupying != nil
		validates_associated :user
	end
end
