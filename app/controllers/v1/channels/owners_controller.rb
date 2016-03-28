class V1::Channels::OwnersController < ApplicationController
  before_action :require_token!

  def index
    channels = @token.user.channels
  end

  def show
    # Make sure the token user is the channel owner
    channel = Channel.find(params[:id])
  end

  def create
    channel = Channel.new(allowed_params)
    channel.owner = @token.user
    if channel.save
      render json: channel, status: 200
    else
      render json: channel.errors.messages, status: 422
    end
  end

  def update
    # Make sure the token user is the channel owner
    channel = Channel.find(params[:id])
    if channel.update(allowed_params)
      render json: channel, status: 200
    else
      render json: channel.errors.messages, status: 422
    end
  end

  def destroy
    # Make sure the token user is the channel owner
    channel = Channel.find(params[:id])
    channel.destroy

    render status: 204
  end

  private

  def allowed_params
    params.require(:data).permit(:name, :description)
  end
end
