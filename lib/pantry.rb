class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def restock(ingredient, amount)
    stock[ingredient] += amount
  end

  def stock_check(ingredient)
    stock[ingredient]
  end
end
