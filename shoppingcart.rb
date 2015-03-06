require 'date'

class ShoppingCart

  attr_accessor :items

  def initialize
    @items = Array.new
    @total_price = 0
    @total_discount = 0
  end

  def add(item)
    @items << item
  end

  def price
    @items.each do |item|
      @total_price += item.price
      @total_discount += item.discount      
    end
    return @total_price - @total_discount
  end

end

class Item

  attr_accessor :price

  def initialize(price = 0)
    @price = price
  end

end

class Fruit < Item

  def initialize(price = 0)
    super(price)
  end

  def discount
    if (Date.new(2015,3,8).cwday > 5) 
      return @price * 0.1
    else
      return 0
    end
  end

end

class Houseware < Item

  def initialize(price)
    super(price)
  end

  def discount
    if @price > 100
      return @price * 0.05
    else
      return 0
    end
  end 
end

myCart = ShoppingCart.new

product_one = Houseware.new(120)
product_two = Houseware.new(80);

myCart.add(product_one)
myCart.add(product_two)

puts myCart.price