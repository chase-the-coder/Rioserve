class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates_presence_of :name, :capacity, :category, :address
end
