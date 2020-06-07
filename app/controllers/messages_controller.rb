class MessagesController < ApplicationController
	before_action :set_message, only: [:show,:edit,:update,:destroy]
	
	def index
	  @messages = Message.find(:all)

	  respond_to do |format|
	    format.html # index.html.erb
	    format.xml  { render :xml => @messages }
	  end
	end
	
	def new
		@message = Message.new
	end

	def create
		@message = Message.create(msg_params)
		@message.user = current_user
		if @message.save
			ActionCable.server.broadcast 'room_channel',
							content: @message.content,
							user: @message.user
		end
	end

	def edit
		@message = Message.find(params[:id])
	  end

	private

	def msg_params
		params.require(:message).permit(:content)
	end
end
