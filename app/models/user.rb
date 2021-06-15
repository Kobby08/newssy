class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  acts_as_voter

  # associations
  has_one :channel
  has_many :categories
  has_many :links, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribed_channels, through: :subscriptions, source: :channel

  # validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username

  # interface
  def is_a_subscriber?(channel)
    return true if subscribed_channels.include?(channel)
  end

  def name
    "#{first_name} #{last_name}"
  end
end
