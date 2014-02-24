class MessagesController < ApplicationController
  # before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to '/', notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
      MessageMailer.send_message(@message).deliver
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :message)
    end
end
