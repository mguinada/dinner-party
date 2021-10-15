class Ingredient < ApplicationRecord
  validates :description, presence: true, uniqueness: true
end
