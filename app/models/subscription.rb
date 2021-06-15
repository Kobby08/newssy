class Subscription < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :channel

  # callbacks
  after_create :notify_channel
  after_destroy :notify_creator


  private
  def notify_channel
      Notification.create(
      notify_type: 'subscribe',
      actor: user,
      user: channel.user,
      target: self,
      second_target: channel,
    )
  end

    def notify_creator
      Notification.create(
      notify_type: 'unsubscribe',
      actor: user,
      user: channel.user,
      target: self,
      second_target: channel,
    )
  end
end
