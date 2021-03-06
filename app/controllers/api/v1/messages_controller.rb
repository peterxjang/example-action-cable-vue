class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user).all.order(created_at: :desc)
    render "index.json.jbuilder"
  end

  def create
    @message = Message.new(
      body: params[:body],
      user_id: current_user.id
    )
    @message.save

    ActionCable.server.broadcast 'activity_channel', {
      id: @message.id,
      name: @message.user.name,
      body: @message.body
    }
    
    render "show.json.jbuilder"
  end
end
