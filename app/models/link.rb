class Link < ApplicationRecord
  # associations
  belongs_to :channel
  belongs_to :user

  # validations
  validates_presence_of :title, minimum: 10
  validates_presence_of :url
end
