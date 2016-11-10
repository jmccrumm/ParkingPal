class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	has_one :schedule
<<<<<<< HEAD
	acts_as_messageable

	def mailboxer_name
		return self.name
	end

	def mailboxer_email(object)
		return self.email
	end

=======

	
	validates :LPN, format: {with: /\w{3}[-\s]?\w{3,4}/, message: 'Invalid License Plate'}
>>>>>>> 18a405bbe5bd17ef014d3518076a7d6b54ac1f9a
end
