class Factory
	attr_accessor :product
	def produce
		@product.new
	end
end

class Product
	def p1
		puts "Product p1 #{self}"
	end
end

class Product1
	def p2
		puts "Product1 p2 #{self}"
	end
end

fac = Factory.new
fac.product = Product
fac.produce.p1

fac2 = Factory.new
fac2.product = Product1
fac2.produce.p2