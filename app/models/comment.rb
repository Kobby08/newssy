class Comment < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :link

  # validations
  validates_presence_of :body
end
