class Comment < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :link

  # validations
  validates_presence_of :body

  # callback
  after_create :notify_creator

  private

  def notify_creator
    Notification.create(
      notify_type: 'comment',
      actor: user,
      user: link.user,
      target: self,
      second_target: link,
    )
  end
end
