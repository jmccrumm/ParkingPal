class Parkingspot < ActiveRecord::Base
	belongs_to :parkinglot
	has_one :user
	validates :id, presence: true
	validates :status, presence: true
end
