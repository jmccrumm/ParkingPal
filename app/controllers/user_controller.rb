#user controller
class UserController < ApplicationController
	#extend Mailboxer::Models::Messageable::ActiveRecordExtension
	protect_from_forgery prepend: true
	before_action :authenticate_user! #check if the user is logged in
	#to verify user is signed in: user_signed_in?
	#for the current user, the helper is available: current_user
	#can access the session of the this scope: user_session
	#can override 'after_sign_in_path_for' and 'after_sign_out_path_for' for where the user will end up after signing in and out
	def index
		@users = current_user
	end

end
