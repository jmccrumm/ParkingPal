class MessageController < ApplicationController
	protect_from_forgery prepend: true
	before_action :authenticate_user!

	def index
		#current_user gets the last conversation (chronologically, the first in the inbox)
		#conversation = current_user.mailbox.inbox.first
		mailboxVar = current_user.mailbox
		@receipts = mailboxVar.conversations
		#@receipts = conversation

		#conversation = current_user.mailbox.inbox
		#@receipts = current_user.mailbox.inbox

		#current_user gets its receipts chronologically ordered
		#@receipts = conversation.receipts_for current_user
	end

	def display
		msgid = params['msg'];
		@message = current_user.mailbox.conversations.find(msgid)
		#@body = @message.receipts_for(current_user)
		

	end

	def compose
		#recipient = User.find(email: params['recipient'])
		@recipient = User.where(["email = :r", {r: params['recipient'][0]}])
		@subject = params['subject'][0]
		@body = params['body'][0]

		if !@recipient.empty?
			session[:recipient] = @recipient[0].email
		end
		session[:subject] = @subject
		session[:body] = @body

		if @recipient.empty?
			flash[:failure] = "User does not exist"
			redirect_to message_new_path
		elsif @subject.empty?
			flash[:failure] = "Please enter a subject"
			redirect_to message_new_path
		elsif @body.empty?
			flash[:failure] = "Please enter something to send"
			redirect_to message_new_path
		else
			conversation = current_user.send_message(@recipient, @body, @subject).conversation
			session[:recipient] = ''
			session[:subject] = ''
			session[:body] = ''
			redirect_to message_path
			#flash[:success] = "Successfully sent message"
		end
		
	end

	def new
		
	end
end
