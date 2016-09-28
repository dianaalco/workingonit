class ShoppingCart

	def initialize
		@prices_list = FileReader.new
		@items = []
	end

	def add (item)
		@items << item
	end

	def item_counter
		@items.length
	end

	def total_cost
		@cost = 0
		@items_prices_pairs = @prices_list.read
		single_item_discount
		several_items_discount
	end

	def single_item_discount
		@items.each do |item|
			price = @items_prices_pairs[item.name].to_i
			discount = item.discount(price)
			@cost += price - discount
		end
	end

	def several_items_discount
		
		if item_counter > 5
			@cost - 0.1 * @cost
		else
			@cost
		end
	end

end

class Item 
	attr_accessor :name
	def initialize(name)
		@name = name
	end
	def discount(price)
		0
	end
end

class Fruit < Item
	def discount(price)
		if Date.today.wday == 0 || Date.today.wday == 6
			0.1 * price
		else
			0
		end
	end
end

class Housewares < Item
	def discount(price)
		if price > 100
			0.05 * price
		else
			0
		end
	end
end

class FileReader
	def read
		file = IO.read('prices.txt')
		items = file.split("\n")		
		items_hash = {}
		items.each do |item|
			item = item.split(",")
			items_hash[item[0]] = item[1]
		end
		return items_hash
	end
end

cart = ShoppingCart.new
orange_juice = Fruit.new("Orange Juice")
bananas = Fruit.new("Bananas")
vacuum_cleaner = Housewares.new("Vacuum cleaner")
rice = Item.new("Rice")
anchovies = Item.new("Anchovies")


cart.add(orange_juice)
cart.add(bananas) 
cart.add(vacuum_cleaner)
cart.add(rice)
cart.add(anchovies)

puts cart.total_cost
