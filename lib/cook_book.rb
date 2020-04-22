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

end
