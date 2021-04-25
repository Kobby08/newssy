class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, only: %i[create destroy]
  def create
    @subscription =
      Subscription.where(user_id: current_user.id, channel_id: @channel.id)
        .first_or_create
    if @subscription.save
      flash[:notice] = "You've subscribed to #{@channel.name}"
      redirect_to @channel
    else
      flash[:alert] = "You could not subscribe to #{@channel.name}"
      redirect_to @channel
    end
  end

  def destroy
    @subscription =
      Subscription.find_by(user_id: current_user.id, channel_id: @channel.id)
    @subscription.destroy
    flash[:alert] = "You've unsubcribed from #{@channel.name}"
    redirect_to @channel
  end

  private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
