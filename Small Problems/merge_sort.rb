# Merge Sort
# Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]
# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]
# Examples:




# Algorithm
# Merge sort keeps on dividing the list into equal halves until it can no more be divided. By definition, if it is only one element in the list, it is sorted. Then, merge sort combines the smaller sorted lists keeping the new list sorted too.

# Step 1 − if it is only one element in the list it is already sorted, return.
# Step 2 − divide the list recursively into two halves until it can no more be divided.
# Step 3 − merge the smaller lists into new list in sorted order.
# Pseudocode
# We shall now see the pseudocodes for merge sort functions. As our algorithms point out two main functions − divide & merge.

# Merge sort works with recursion and we shall see our implementation in the same way.

def merge_sort(array)
   return array if array.size == 1
   sub_arr1 = array[0...array.size / 2]
   sub_arr2 = array[(array.size / 2)...array.size]

   sub_arr1 = merge_sort(sub_arr1)
   sub_arr2 = merge_sort(sub_arr2)

   return merge(sub_arr1, sub_arr2)
end

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


# procedure mergesort( var a as array )
#    if ( n == 1 ) return a

#    var l1 as array = a[0] ... a[n/2]
#    var l2 as array = a[n/2+1] ... a[n]

#    l1 = mergesort( l1 )
#    l2 = mergesort( l2 )

#    return merge( l1, l2 )
# end procedure

# procedure merge( var a as array, var b as array )

#    var c as array
#    while ( a and b have elements )
#       if ( a[0] > b[0] )
#          add b[0] to the end of c
#          remove b[0] from b
#       else
#          add a[0] to the end of c
#          remove a[0] from a
#       end if
#    end while
   
#    while ( a has elements )
#       add a[0] to the end of c
#       remove a[0] from a
#    end while
   
#    while ( b has elements )
#       add b[0] to the end of c
#       remove b[0] from b
#    end while
   
#    return c
  
# end procedure



p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]




