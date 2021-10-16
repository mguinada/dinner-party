class CreateRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingredients, id: false, force: :cascade do |t|
      t.integer :recipe_id, null: false
      t.integer :ingredient_id, null: false

      t.timestamps
    end

    add_index :recipe_ingredients, [:recipe_id, :ingredient_id], name: :recipe_ingredients_on_recipe_id_and_ingredient_id, unique: true
  end
end
