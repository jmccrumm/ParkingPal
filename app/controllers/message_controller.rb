#handles our messaging
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
		recipient = User.where(["email = :r", {r: params['recipient'][0]}])
		subject = params['subject'][0]
		body = params['body'][0]

		if !recipient.empty?
			session[:recipient] = recipient[0].email
		end
		session[:subject] = subject
		session[:body] = body

		if recipient.empty?
			flash[:failure] = "User does not exist"
		elsif subject.empty?
			flash[:failure] = "Please enter a subject"
		elsif body.empty?
			flash[:failure] = "Please enter something to send"
		else

			conversation = current_user.send_message(recipient, body, subject).conversation
			session[:recipient] = session[:subject] = session[:body] = ''
			flash[:success] = "Successfully sent message"
			redirect_to message_path and return
		end

		redirect_to message_new_path # did not send successfully

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
