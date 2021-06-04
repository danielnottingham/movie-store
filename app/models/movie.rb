class Movie < ApplicationRecord
  belongs_to :category
  validates :title, :description, :rent_price, presence: true
end
