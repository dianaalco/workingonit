class Milkshake

	def initialize
	@base_price = 3
	@ingredients = (" ")

	def add_ingredients(ingredients)
		return @ingredients.push(ingredients)
	end
	def price_of_milkshake
	total_price_of_milkshake = @base_price
	return @ingredients.each do |ingredient|
	end
		total_price_of_milkshake += ingredient_price
	end

	return total_price_of_milkshake
end
end

class Ingredient
		attr_reader :name, :price
		def initialize(name, price)
			@name = name
			@price = price
		end	

end
milkshake = Milkshake.new
cream = Ingredient.new("Cream", 2)
chocolate = Ingredient.new("Chocolate", 1)
milkshake.add_ingredient(cream)
milkshake.add_ingredient(chocolate)
puts milkshake.price_of_milkshake
