class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true
  has_many :reservations, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  has_one_attached :photo
end
