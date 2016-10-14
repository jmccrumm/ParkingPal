class Parkingspot < ActiveRecord::Base
	belongs_to :parkinglot
	validates :status, presence: true
end
