class Channel < ApplicationRecord
  # associations
  has_many :links, dependent: :destroy
  belongs_to :user

  # validations
  validates_presence_of :name, unique: true
  validates_presence_of :description
end
