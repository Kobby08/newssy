class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, except: %i[index new create]

  def index
    @channels = Channel.all
    authorize @channels, :index?
  end

  def show
    authorize @channel, :show?
  end

  def new
    @channel = Channel.new
    authorize @channel, :new?
  end

  def create
    @channel = Channel.new(channel_params.merge(user_id: current_user.id))
    authorize @channel, :create?
    if @channel.save
      flash[:notice] = 'Channel was created successfuly.'
      redirect_to @channel
    else
      flash.now[:alert] = 'Channel was not created.'
      render 'new'
    end
  end

  def edit
    authorize @channel, :edit?
  end

  def update
    authorize @channel, :update?
    if @channel.update(channel_params)
      flash[:notice] = 'Channel was updated successfuly.'
      redirect_to @channel
    else
      flash.now[:alert] = 'Channel was not updated.'
      render 'edit'
    end
  end

  def destroy
    authorize @channel, :destroy?
    @channel.destroy
    flash[:alert] = 'Channel was deleted.'
    redirect_to channels_path
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.required(:channel).permit(:name, :description, :user_id)
  end
end
