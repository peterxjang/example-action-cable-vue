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
    render "show.json.jbuilder"
  end
end
