class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	has_one :schedule

	
	validates :LPN, format: {with: /[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{3,4}/, message: 'Invalid License Plate'}
end
