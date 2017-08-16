class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.all
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
