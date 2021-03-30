class ChannelsController < ApplicationController
  before_action :set_channel, except: %i[index new create]

  def index
    @channels = Channel.all
  end

  def show; end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      flash[:notice] = 'Channel was created successfuly.'
      redirect_to @channel
    else
      flash.now[:alert] = 'Channel was not created.'
      render 'new'
    end
  end

  def edit; end

  def update
    if @channel.update(channel_params)
      flash[:notice] = 'Channel was updated successfuly.'
      redirect_to @channel
    else
      flash.now[:alert] = 'Channel was not updated.'
      render 'edit'
    end
  end

  def destroy
    @channel.destroy
    flash[:alert] = 'Channel was deleted.'
    redirect_to channels_path
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.required(:channel).permit(:name, :description)
  end
end
