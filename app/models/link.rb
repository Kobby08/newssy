class Link < ApplicationRecord
  # associations
  #belongs_to :channel

  # validations
  validates_presence_of :title, minimum: 10
  validates_presence_of :url
end
