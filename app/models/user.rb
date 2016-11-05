class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	has_one :schedule

	
	validates :LPN, format: {with: /\w{3}[-\s]?\w{3,4}/, message: 'Invalid License Plate'}
end
