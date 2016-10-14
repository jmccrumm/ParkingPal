class Parkingspot < ActiveRecord::Base
	belongs_to :parkinglot
	#validates :location, presence: true
	validates :status, presence: true
end
