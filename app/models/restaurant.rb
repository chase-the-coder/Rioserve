class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates_presence_of :name, :capacity, :category, :address

  def occupation_for(date)
    total = 0
    reservations.each { |reservation| total += reservation.number_of_people if reservation.date.to_s == date.to_s }
    total
  end
end
