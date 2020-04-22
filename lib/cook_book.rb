require 'date'
class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients

    cook_book_ingredients = recipes.flat_map do |recipie|
      recipie.ingredients_required.keys
    end.uniq
    ingredient_names = cook_book_ingredients.map do |ingredient|
      ingredient.name
    end
  end

  def highest_calorie_meal

    @recipes.max_by do |recipie|
      recipie.total_calories
    end
  end

  def date

    (Date.today).strftime("%m-%d-%Y")
  end

  def summary

  summary_hash = Hash.new(0)

    recipes.each do |recipe|
      ingredients_hash = Hash.new(0)

      recipe.ingredients_required.each do |ingredient|
        ingredients_hash[:ingredient] = ingredient.name
        ingredients_hash[:amount] = ingredient.amount
      end
      #require"pry";binding.pry
      summary_hash[:name] = recipe.name
      summary_hash[:details] = {
        summary_hash[:ingredients] = ingredients_hash
        summary_hash[:total_calories] = recipe.total_calories
      }
  end
end

end
