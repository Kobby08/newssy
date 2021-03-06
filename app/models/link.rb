class Link < ApplicationRecord
  acts_as_votable

  # associations
  belongs_to :channel
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  # validations
  validates_presence_of :title, minimum: 10
  validates_presence_of :url

end
