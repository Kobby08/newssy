class Channel < ApplicationRecord
  # associations
  #has_many :links

  # validations
  validates_presence_of :name, unique: true
  validates_presence_of :description
end
