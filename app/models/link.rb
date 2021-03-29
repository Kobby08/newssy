class Link < ApplicationRecord
  validates_presence_of :title, minimum: 10
  validates_presence_of :url
end
