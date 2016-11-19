class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	has_one :schedule
	
	acts_as_messageable

	def mailboxer_name
		return self.name
	end

	def mailboxer_email(object)
		return self.email
	end

	validates :name, presence: true

	validates :email, presence: true
	validates :email, confirmation: true
	validates :email, uniqueness: true

	validates :password, presence: true
	validates_length_of :password, :minimum => 6, :allow_nil => false

	validates :LPN, presence: true
	validates :LPN, format: {with: /\w{3}[-\s]?\w{3,4}/, message: 'Invalid License Plate'}
end
