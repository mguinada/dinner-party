# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

def for_each_recipe(json_file)
  recipes = File.readlines(json_file)

  num_recipes = recipes.count

  progress = ProgressBar.create(
    title: "Recipes",
    total: num_recipes,
    remainder_mark: "\u{FF65}",
    progress_mark: " ",
    format: "%a %b\u{15E7}%i %p%% %e | %c of %C %t seeded"
  )

  recipes.each do |json_recipe|
    parsed_recipe = JSON.parse(json_recipe)
    yield OpenStruct.new(parsed_recipe)
    progress.increment
  end

  progress.finish
end

recipes_json = Rails.root.join('db', 'recipes.json')

ActiveRecord::Base.transaction do
  for_each_recipe(recipes_json) do |recipe|
    r = Recipe.create! do |r|
      r.name = recipe.name
      r.rate = recipe.rate
      r.budget = recipe.budget
      r.prep_time = recipe.prep_time
      r.cook_time = recipe.cook_time
      r.total_time = recipe.total_time
      r.author = recipe.author
      r.difficulty = recipe.difficulty
      r.people_quantity = recipe.people_quantity
      r.tags = recipe.tags
      r.image = recipe.image
      r.author_tip = recipe.author_tip
      r.ingredients = recipe.ingredients.map do |ingredient|
        Ingredient.find_or_create_by(description: ingredient)
      end.uniq
    end
  end
end
