class Parkingspot < ActiveRecord::Base
	belongs_to :parkinglot
	has_one :user

	validates :status, presence: true
end
