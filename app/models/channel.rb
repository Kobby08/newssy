class Channel < ApplicationRecord
  # associations
  belongs_to :user
  has_many :links, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribed_users, through: :subscriptions, source: :user

  # validations
  validates_presence_of :name, unique: true
  validates_presence_of :description
end
