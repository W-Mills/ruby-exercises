# Seeing Stars
# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

# Problem: 
# create a n by n grid, where n is an odd integer that is supplied as an argument to the method
# the smallest star size is 7x7
# print an 8-pointed star with size n


# => except for center row, every other row has 3 stars
# =>  - the number of spaces is always distance in rows from center - 1
# =>  - space = ' ' * number of spaces
# =>   - output = Array.new(3, '*').join(spaces)
# =>    - puts output.center(grid_size)


# max distance is (grid size - 1) / 2
# => from max distance down to 1 distance we want to print the row
# =>  - that row is determined based on distance and the grid size
# => the center row is '*" * the grid size
# => from 1 distance to the max distance we want to print the rows below

# Algorithm:

def print_row(grid_size, distance)
  num_spaces = distance - 1
  spaces = ' ' * num_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
max_distance = (grid_size - 1) / 2
max_distance.downto(1) { |distance| print_row(grid_size, distance) }
puts "*" * grid_size
1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

# Examples

star(47)

# *  *  * # 1*   2x  1*   2x  1* == n
#  * * *  # 1x 1* 1x 1s 1x 1s   == n
#   ***   # 2x   3s 2x         == n
# ******* # *******           == n
#   ***   # 2x *** 2x         == n
#  * * *  # 2x *** 2x         == n
# *  *  * # *   2x  *   2x  * == n
star(9)

# *   *   * 
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
