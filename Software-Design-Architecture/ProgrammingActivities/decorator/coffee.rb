# Decorator Pattern
# Date: 08-Mar-2017
# Authors:
#          A01166738     Aileen N. Ayala   
#          A01372276     Eduardo Castilla

# File: coffee.rb

class Beverage
  attr_accessor :description, :cost
end

class DarkRoast < Beverage
  def description()
    @description = "Dark Roast Coffee"
  end
  
  def cost()
    @cost = 0.99
  end
end

class Espresso < Beverage
  def description()
    @description = "Espresso"
  end
  
  def cost()
    @cost = 1.99
  end
end

class HouseBlend < Beverage
  def description()
    @description = "House Blend Coffee"
  end
  
  def cost()
    @cost = 0.89
  end
end

class CondimentDecorator < Beverage
  def initialize(beverage)
    @beverage = beverage
  end
end

class Mocha < CondimentDecorator
  def cost
     @beverage.cost + 0.2
  end

  def description
    @beverage.description << ", Mocha"
  end
end

class Whip < CondimentDecorator
  def cost
    @beverage.cost + 0.1
  end

  def description
    @beverage.description << ", Whip"
  end
end

class Soy < CondimentDecorator
  def cost
    @beverage.cost + 0.15
  end

  def description
    @beverage.description << ", Soy"
  end
end

class Milk < CondimentDecorator
  def cost
    @beverage.cost + 0.1
  end

  def description
    @beverage.description << ", Milk"
  end
end