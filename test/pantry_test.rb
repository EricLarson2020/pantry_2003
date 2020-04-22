require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/ingredient'

class PantryTest < MiniTest::Test

  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_pantry_stock
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    assert_equal ({}), pantry.stock
    assert_equal 0, pantry.stock_check(ingredient1)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal 15, pantry.stock_check(ingredient1)
  end
end
