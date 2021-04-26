class Category < ApplicationRecord
  # associations
  belongs_to :user
  has_many :links

  # validations
  validates_presence_of :name
  validates_uniqueness_of :name
end
