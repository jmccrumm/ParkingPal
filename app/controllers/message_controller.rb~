#handles our messaging
# :reek:DuplicateMethodCall { max_calls: 3 }
class MessageController < ApplicationController
	protect_from_forgery prepend: true
	before_action :authenticate_user!

	def index
		#current_user gets the last conversation (chronologically, the first in the inbox)
		#conversation = current_user.mailbox.inbox.first
		mailbox = current_user.mailbox
		@receipts = mailbox.conversations
		#@receipts = conversation

		#conversation = current_user.mailbox.inbox
		#@receipts = current_user.mailbox.inbox

		#current_user gets its receipts chronologically ordered
		#@receipts = conversation.receipts_for current_user
	end

	def display
		@duplicated = false;
		msgid = params['msg'];
		@message = current_user.mailbox.conversations.find(msgid)
		#@body = @message.receipts_for(current_user)
	end

	def compose
		#recipient = User.where(["email = :r", {r: params['recipient'][0]}])
		#subject = params['subject'][0]
		#body = params['body'][0]
		parameters = MessageController.getparams(params)

		setcomposesessions(parameters)

		if setflasherrors(parameters)
			sendmessage(parameters)
			redirect_to message_path and return
		end

		#setcomposesessions(recipient, subject, body)

		#if setflasherrors(recipient, subject, body)
		#	current_user.send_message(recipient, body, subject).conversation
		#	session[:recipient] = session[:subject] = session[:body] = ''
		#	flash[:success] = "Successfully sent message"
		#	redirect_to message_path and return
		#end

		redirect_to message_new_path # did not send successfully

	end

	def setcomposesessions(params)
		if !params[0].empty?
			session[:recipient] = params[0][0].email
		end
		session[:subject] = params[1]
		session[:body] = params[2]
	end

	def setflasherrors(params)
		if params[0].empty?
			flash[:failure] = "User does not exist"
			false
		elsif params[1].empty?
			flash[:failure] = "Please enter a subject"
			false
		elsif params[2].empty?
			flash[:failure] = "Please enter something to send"
			false
		else 
			true
		end
	end

	def self.getparams(params)
		[User.where(["email = :r", {r: params[:recipient][0]}]),
		params[:subject][0],
		params[:body][0]]
	end

	def sendmessage(parameters)
			current_user.send_message(parameters[0], parameters[2], parameters[1]).conversation
			session[:recipient] = session[:subject] = session[:body] = ''
			flash[:success] = "Successfully sent message"
	end

	def new
	end

	def reply
		@msgid = params['msg'];
		#@message = current_user.mailbox.conversations.find(msgid)
	end

	def send_reply
		msgid = params['msg'];
		conversation = current_user.mailbox.conversations.find(msgid)
		body = params['body'][0]
		current_user.reply_to_conversation(conversation, body).conversation;
		redirect_to message_path
	end

  def trash
		msgid = params['msg'];
		conversation = current_user.mailbox.conversations.find(msgid)
		conversation.mark_as_deleted current_user
    redirect_to :back
  end

  def untrash
  end
end
