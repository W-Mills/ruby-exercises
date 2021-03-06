# # Refactoring Vehicles
# # Consider the following classes:

# class Vehicle
#   attr_reader :make, :model, :wheels

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Car < Vehicle
#   def initialize(make, model)
#     super
#     @wheels = 4
#   end
# end

# class Motorcycle < Vehicle
  
#   def initialize(make, model)
#     super
#     @wheels = 2
#   end
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#     @wheels = 6
#   end
# end

# class Snowmobile < Vehicle; end

# car = Car.new("Mazda", 3)
# p car.wheels

# snowy = Snowmobile.new("Bombardier", "Panther")
# p snowy.wheels

# Refactor these classes so they all use a common superclass, and inherit behavior as needed.


class Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def initialize(make, model)
    super
    @wheels = 4
  end
end

class Snowmobile < Vehicle; end

car = Car.new("Mercedes-Benz", "S550")
p car.wheels

snowy = Snowmobile.new("Bombardier", "Panther")
p snowy.wheels