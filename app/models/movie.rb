class Movie < ApplicationRecord
  belongs_to :category
  validates :title, :description, :rent_price, presence: true

  enum status: { active: 0, disabled: 10 }
end
