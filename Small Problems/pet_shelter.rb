# Pet Shelter
# Consider the following code:

class Owner
  attr_reader :pets, :name
  attr_accessor :number_of_pets

  def initialize(name)
    @name = name
    @pets = []
    @number_of_pets = 0
  end
end

class Pet
  attr_reader :species, :name

  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{species} named #{name}"
  end
end

class Shelter
  attr_reader :adopters, :unadopted_pets

  def initialize
    @adopters = []
    @unadopted_pets = []
  end

  def adopt(new_owner, pet)
    new_owner.pets << pet
    new_owner.number_of_pets += 1
    adopters << new_owner unless adopters.include?(new_owner)
  end

  def rescue(pet)
    @unadopted_pets << pet
  end

  def print_adoptions
    adopters.each do |adopter|
      puts "#{adopter.name} has adopted the following pets:"
      adopter.pets.each {|pet| puts pet}
    end
    display_unadopted_pets
  end

  def display_unadopted_pets
    puts "\nThe Animal Shelter Has The Following Unadopted Pets:"
    unadopted_pets.each do |pet|
      puts pet
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')


# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

shelter = Shelter.new

shelter.rescue(butterscotch)
shelter.rescue(pudding)
shelter.rescue(darwin)
shelter.rescue(kennedy)
shelter.rescue(sweetie)
shelter.rescue(molly)
shelter.rescue(chester)

# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

wmills = Owner.new('W Mills')
bowzer = Pet.new('cat', 'Bowzer')
angus = Pet.new('dog', 'Angus')
burgal = Pet.new('cat', 'Burgal')
scout = Pet.new('cat', 'Scout')
shelter.adopt(wmills, bowzer)
shelter.adopt(wmills, angus)
shelter.adopt(wmills, burgal)
shelter.adopt(wmills, scout)
shelter.print_adoptions
puts
puts "#{wmills.name} has #{wmills.number_of_pets} adopted pets."



# Write the classes and methods that will be necessary to make this code run, and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The order of the output does not matter, so long as all of the information is presented.