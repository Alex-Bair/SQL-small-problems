=begin

Thought process:

Data Structure: Use an array for revolving queue. Objects will enter the array at the end of the array, and will move towards the front of the array as more objects are added. When each object is added, the front-most element is removed.

When an object is removed (dequeued), the first non-nil object in the array is replaced with nil.

=end


class CircularQueue
  EMPTY_SPOT = nil
  
  def initialize(buffer_size)
    @queue = Array.new(buffer_size, EMPTY_SPOT)
  end

  def dequeue
    removed_element = nil
    queue.each_with_index do |ele, idx|
      if ele != nil
        removed_element = ele
        queue[idx] = EMPTY_SPOT
        break
      end
    end
    
    removed_element
  end

  def enqueue(obj)
    queue.shift
    queue << obj
  end

  private

  attr_reader :queue
end

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

# LS Solution

class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
    end

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size
  end
end

# Further Exploration

# See my original solution - it used Array#shift and Array#<<

# JDF's solution is below

class CircularQueue
  def initialize(size)
    @queue = []
    @max_size = size
  end

  def enqueue(obj)
    dequeue if queue.size == max_size
    queue << obj
  end

  def dequeue
    queue.shift
  end

  private
  attr_accessor :queue, :max_size
end