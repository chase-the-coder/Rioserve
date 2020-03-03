class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates_presence_of :name, :capacity, :category, :address
  include PgSearch::Model

  def occupation_for(date)
    total = 0
    reservations.each { |reservation| total += reservation.number_of_people if reservation.date.to_s == date.to_s }
    total
  end

  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }
end

