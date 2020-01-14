# Fix the Bug
# The following code:

# Broken Code:

# def my_method(array)
#   if array.empty?
#     []
#   elsif
#     array.map do |value|
#       value * value
#     end
#   else
#     [7 * array.first]
#   end
# end

# Fixed code: the conditional expression for elsif on line 9 wasn't entered as intended, so the Ruby interpreter looked at the next line and evaluated the array.map method as the condition (and array.map evaluates to true), so the branch is essentially empty code, which returns nil


def my_method(array)
  if array.empty?
    []
  elsif array.map {|value| value * value } # this produces an array, which evaluates to true, so the empty elsif branch is executed (which returns nil)
  else
    [7 * array.first]
  end
end


# def my_method(array)
#   if array.empty?
#     []
#   elsif array.size >= 2
#     array.map do |value| 
#       value * value
#     end
#   else
#     [7 * array.first]
#   end
# end

p my_method([]) #== []
puts
p my_method([3]) #== [21]
puts
p my_method([3, 4]) #== [9, 16]
puts
p my_method([5, 6, 7]) #== [25, 36, 49]





