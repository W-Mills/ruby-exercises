# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

## => create an array of with a true value to represent each light starting off
## => iteration the on position. 
##   
## => iterate over that collection using the doubles of the current iteration number to make each light value not what it was before (2,4,6,8 etc...)
## => convert the final array of positive values back to integers and return that value

def initialize_lights(num_lights)
  lights = Hash.new
  1.upto(num_lights) { |light| lights[light] = "off" }
  lights
end

def on_lights(lights)
  lights.select { |position, state| state == "on" }.keys
end

def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

def toggle_lights(num_lights)
  lights = initialize_lights(num_lights)
  1.upto(lights.size) do |iteration_num|
    toggle_every_nth_light(lights, iteration_num)
  end

  on_lights(lights)
end

p toggle_lights(1000)
puts toggle_lights(5) == [1,4]
puts toggle_lights(10) == [1, 4, 9]


# Further Exploration
# There are a few interesting points about this exercise that we can explore:

# Do you notice the pattern in our answer? Every light that is on is a perfect square. Why is that?


# What are some alternatives for solving this exercise? What if we used an Array to represent our 1000 lights instead of a Hash, how would that change our code?

# We could have a method that replicates the output from the description of this problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we go about writing that code?

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

