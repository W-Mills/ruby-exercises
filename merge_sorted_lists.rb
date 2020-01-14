# Merge Sorted Lists
# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

# Problem: take two sorted arrays, and build a new sorted array one element at a time in the correct ascending order

# what to do about equal values? => take one value, it will eventually lead to different values

# Input: 2 sorted arrays
# Output: 1 sorted array

# Algorithm: 

# => init a variable to count indexes (call it index_2)
# => init an empty sorted_array to be returned later
# => iterate over the first array using each
# =>  - use a while loop, with the conditions:
# =>    - that the index of arr2 is less than the size of arr2
# =>    - && arr2[index_2] is <= the value being compared
# =>  - shovel the arr2[index_2] and increment the index counter, end loop
# =>  - shovel the value into the sorted_array (basically comparing element-wise, so this is the greater than element)
# => return the sorted_array concatenated with the arr2 elements (in the case of arr1 being an empty array, but arr2 being populated)

def merge(arr_1, arr_2)
  index_2 = 0
  sorted_arr = []
  arr_1.each do |value|
    while index_2 < arr_2.size && arr_2[index_2] <= value
      sorted_arr << arr_2[index_2]
      index_2 += 1
    end
    sorted_arr << value
  end
  sorted_arr.concat(arr_2[index_2..-1])
end

# Examples:

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]