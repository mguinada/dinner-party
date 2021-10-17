class RecipesController < ApplicationController
  def search
    respond_to do |format|
      format.json do
        recipes = Recipe.by_ingredients(params[:ingredients].split(',').map(&:strip))
        render json: recipes, include: :ingredients
      end
    end
  end
end
