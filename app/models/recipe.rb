class Recipe < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :ingredients, join_table: :recipe_ingredients

  scope :by_ingredients, ->(ingredient_names) do
    return none if ingredient_names.blank?

    ingredient_ids = Ingredient.by_descriptions(ingredient_names).pluck(:id)

    joins(:ingredients)
     .joins(
       <<~SQL.strip_heredoc
        INNER JOIN (
          SELECT
            recipe_id,
            count(*)
          FROM
            recipe_ingredients
          GROUP BY recipe_ingredients.recipe_id) AS all_ingredients ON recipes.id = all_ingredients.recipe_id
       SQL
     )
     .where(ingredients: {id: ingredient_ids})
     .group('recipes.id, all_ingredients.count')
     .having("count(ingredients.id) = all_ingredients.count")
  end
end
