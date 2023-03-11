=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide methods to reverse the linked list and convert a linked list to and from an array.

---

**Problem Domain:**

In the simplest linked list, each element contains data and a "next" field pointing to the next element in the list of elements. This is often used to represent sequences or push-down stacks (also called LIFO stack; Last In, First Out)

---

**Explicit Requirements:**

---

**Implicit Requirements:**
- Must have a custom Element class
  - Must have an #initialize method
  - Must have a #tail? method
  - Must have a #datum method
  - Must have a #next method
- Must have a SimpleLinkedList class
  - Must have a #push method.
  - Must have a #size method.
  - Must have a #peek method.
  - Must have a #head method.
  - Must have a #to_a method.
  - Must have a #reverse method.
---

**Clarifying Questions:**

1. Can we leverage other Ruby standard classes in our solution, like arrays?
  Yes.

---

**Mental Model:**

Element class
INSTANCE METHODS
#initialize => accepts one or two arguments. First argument is assigned to @datum, second optional argument is assigned to @next (default value of nil)
#tail? => returns true if it is the last element in a SimpleLinkedList. Checks if @next is nil (tail of list).
#next => exposes @next
#datum => exposes @datum

LinkedList class
INSTANCE METHODS
#tail => returns the current tail of the list (AKA the current first element in @list)
#head => returns the current head of the list (AKA the current last element in @list)
#push => initializes a new Element object with the argument, and appends it to the end of @list
#size => returns how many elements are in @list
#peek => returns the datum of the tail element in @list. Returns nil if list is empty.
#reverse => returns a new LinkedList object with the elements in @list reversed (note: need to clone the elements & update their @next's)
#empty? => returns true if @list is empty
#pop => removes and returns the head of @list
#to_a => creates & returns an Array objects from the calling LinkedList object

CLASS METHODS
#from_a => creates & returns a LinkedList object from an Array object - treats an empty array and nil as acceptable arguments (creates empty LinkedList)

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See test cases in simple_linked_list_test.rb

---

Data Structure
--------------

Element class
  @datum => the value of the element
  @next => the element next in the linked list

LinkedList class
@list => stores elements in it. Use an array to contain elements. Example:
  [
    Element1, #first in list - also called the tail of the list
    Element2, #second in list, points to Element1
    Element3  #third in list, points to Element3 - also called the head of the list
  ]

---

Algorithm
---------

LinkedList methods

#reverse
- initialize a new SimpleLinkedList object. Assign to local variable 'new_list'
- Iterate over @list in reverse order.
  - Push each element's datum to 'new_list'
- Return 'new_list'

#from_a.
  - guard clause returning empty SimpleLinkedList if input is empty or nil.
  input: [1, 2]
  - iterate over the input array in reverse order
    - push each element into @list in order.

#to_a
  - iterate over @list. Prepend the datum of each element to an empty array. Return the array.

Code
----

=end

class Element
  attr_reader :datum, :next

  def initialize(d, n = nil)
    @datum = d
    @next = n
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def tail
    @list.first
  end

  def head
    @list.last
  end

  def push(value)
    @list << Element.new(value, head)
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def peek
    return nil if @list.empty?
    head.datum
  end

  def pop
    @list.pop.datum
  end

  def to_a
    arr = []

    return arr if empty?

    @list.each do |element|
      arr.prepend(element.datum)
    end

    arr
  end

  def reverse
    new_list = SimpleLinkedList.new

    @list.reverse_each do |element|
      new_list.push(element.datum)
    end

    new_list
  end

  def self.from_a(arr)
    l = self.new

    return l if arr.nil? || arr.empty?

    arr.reverse_each do |val|
      l.push(val)
    end

    l
  end
end
