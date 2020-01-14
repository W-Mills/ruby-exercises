require 'pry'

# Circular Queue
# A circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular queue, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the queue the longest.

# This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires getting rid of an existing object; with a circular queue, the object that has been in the queue the longest is discarded and replaced by the new object.


### Problem:
# A circular queue is a collection of objects stored in a buffer
# When an object is added to the queue, it is added to the position that immediately follows the most recently added object
# Removing an object always removes the object that has been in the queue the longest (the oldest)
# If the buffer becomes full, adding a new object will replace the oldest item in the queue

# Assuming we have a circular queue with room for 3 objects, the circular queue looks and acts like this:

# P1  P2  P3  Comments
# All positions are initially empty
# 1     Add 1 to the queue
# 1 2   Add 2 to the queue
# 2   Remove oldest item from the queue (1)
# 2 3 Add 3 to the queue
# 4 2 3 Add 4 to the queue, queue is now full
# 4   3 Remove oldest item from the queue (2)
# 4 5 3 Add 5 to the queue, queue is full again
# 4 5 6 Add 6 to the queue, replaces oldest element (3)
# 7 5 6 Add 7 to the queue, replaces oldest element (4)
# 7   6 Remove oldest item from the queue (5)
# 7     Remove oldest item from the queue (6)
# Remove oldest item from the queue (7)
# Remove non-existent item from the queue (nil)
# Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

# enqueue to add an object to the queue
# dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.
# You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

#______________________________________________________________________________
## First attempt went way off into the weeds:

# class CircularQueue
#   attr_reader :buffer_size
#   attr_accessor :circular_queue, :queue_number, :index_last_added

#   def initialize(buffer_size)
#     @buffer_size = buffer_size
#     @queue_number = 0
#     @circular_queue = FixedArray.new(buffer_size, [nil])
#   end

#   def []=(index, new_object)
#     circular_queue[index] = [new_object]
#   end

#   def enqueue(object)
#     #binding.pry
#     oldest = find_oldest
#     puts "oldest is #{oldest}"
#     if queue_empty?
#       circular_queue[oldest] = [queue_number, object]
#       self.index_last_added = oldest
#     else 
#       circular_queue[(index_last_added + 1)] = [queue_number, object]
#       self.index_last_added = index_last_added + 1
#     end
#     increment_queue_num
#   end

#   # def wrap_around
#   #   if "num" > buffer_size
#   #     "num" = 0
#   #   end
#   # end

#   def find_oldest
#     oldest = nil
#     return 0 if queue_empty?
#     circular_queue.to_a.each do |array|
#       next if array == [nil]
#       if oldest == nil
#         oldest = array[0]
#       elsif oldest > array[0]
#         oldest = array[0]
#       end
#     end
#     oldest
#   end

#   def add_to_first(object)
#     circular_queue[0] = [queue_number, object]
#     increment_queue_num
#   end

#   def queue_empty?
#     circular_queue.to_a.all?([nil])
#   end

#   def increment_queue_num
#     self.queue_number += 1
#   end

#   def dequeue
#     oldest = nil
#     circular_queue.to_a.each do |array|
#       return nil if queue_empty?
#       next if array == nil
#       if array[1]
#         oldest = array[1] if oldest == nil || array[1] < oldest
#       end
#     end
#     circular_queue[oldest] = nil
#     oldest
#   end
# end

# class FixedArray
#   attr_reader :fixed_array_size

#   def initialize(fixed_array_size, default_array_object)
#     @fixed_array = Array.new(fixed_array_size, default_array_object)
#     @fixed_array_size = fixed_array_size
#   end

#   def [](index)
#     raise IndexError if index > fixed_array_size
#     @fixed_array[index]
#   end

#   def []=(index, value)
#     raise IndexError if index > fixed_array_size
#     @fixed_array[index] = value
#   end

#   def to_a
#     @fixed_array.clone
#   end

#   def to_s
#     "#{@fixed_array}"
#   end
# end
#______________________________________________________________________________
## Solution borrowing heavily from LS supplied solution

# class CircularQueue
#   attr_accessor :buffer, :next_position, :oldest_postition

#   def initialize(buffer_size)
#     @buffer = Array.new(buffer_size, nil)
#     @next_position = 0
#     @oldest_postition = 0
#   end

#   def enqueue(object)
#     unless buffer[next_position] == nil
#       self.oldest_postition = increment(next_position)
#     end
#     self.buffer[next_position] = object
#     self.next_position = increment(next_position)
#   end

#   def dequeue
#     object = buffer[oldest_postition]
#     self.buffer[oldest_postition] = nil
#     self.oldest_postition = increment(oldest_postition) unless object == nil
#     object
#   end

#   private

#   def increment(position)
#     (position + 1) % buffer.size
#   end
# end
#______________________________________________________________________________

# Further Exploration using Array#push (adds element to end of array) and Array#shift (removes the first element)

class CircularQueue
  attr_accessor :buffer
  attr_reader :buffer_size

  def initialize(buffer_size)
    @buffer = Array.new
    @buffer_size = buffer_size
  end

  def enqueue(object)
    dequeue if buffer.size == buffer_size
    buffer.prepend(object)
  end

  def dequeue
    buffer.pop
  end
end

# Examples:

queue = CircularQueue.new(3)

puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# The above code should display true 15 times.

