# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

def diamond(num)
  stars = 1
  spaces = (num - stars) / 2
  until stars > num
    puts " " * spaces + "*" * stars + " " * spaces
    stars += 2
    spaces = (num - stars) / 2
  end
  stars = num - 2
  until stars < 1
    spaces = (num - stars) / 2
    puts " " * spaces + "*" * stars + " " * spaces
    stars -= 2
  end
end

# Examples

diamond(1)

# *

diamond(3)

#  *
# ***
#  *

diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

diamond(19)

# Further Exploration
# Try modifying your solution or our solution so it prints only the outline of the diamond:

# diamond(5)

#   *
#  * *
# *   *
#  * *
#   *

  