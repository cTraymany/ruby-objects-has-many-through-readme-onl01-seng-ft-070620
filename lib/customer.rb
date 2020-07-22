require 'pry'
class Customer
  attr_accessor :name, :age
  @@all = []
  
  def initialize(name, age)
    @name = name
    @age = age
    self.class.all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end
  
  def meals
    Meal.all.select { |meal| meal.customer == self}
  end
  
  def waiters
    meals.map { |meal| meal.waiter }
  end
  
  def best_tipper
    tips = []
    tips << Meal.all.tip
    tips.sort!
  end
    
end