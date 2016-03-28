class V1::Channels::ViewersController < ApplicationController
  before_action :require_token!

  def index
    channels = Channel.all
  end

  def show
    channel = Channel.find(params[:id])
  end
end
