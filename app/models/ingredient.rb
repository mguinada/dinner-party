class Ingredient < ApplicationRecord
  validates :description, presence: true, uniqueness: true

  has_and_belongs_to_many :recipes, join_table: :recipe_ingredients

  scope :by_descriptions, ->(descriptions) do
    return none if descriptions.blank? || descriptions.all?(&:blank?)

    scope = all

    descriptions.each_with_index do |description, index|
      query = ["ingredients.description ~* :description", description: "(?!#{IGNORE_TERMS}|[[:space:]]|[[:digit:]])\\y#{description}\\y"]
      scope = index.zero? ? scope.where(*query) : scope.or(Ingredient.where(*query))
    end

    scope
  end

  private

  # Terms for negative lookahead
  IGNORE_TERMS = [
    "d\\'",
    "g",
    "kg",
    "l",
    "dl",
    "cl",
    "du",
    "de",
    "la",
    "cuillère(s)*",
    "tsp",
    "tbsp"
  ].map { |token| "(\\y#{token}\\y)" }.join("|")
end
