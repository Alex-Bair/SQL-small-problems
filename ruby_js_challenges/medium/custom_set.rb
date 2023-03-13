=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Implement my own custom Set class.

---

**Problem Domain:**

---

**Explicit Requirements:**
- Do not use the build-in Set type. Must make my own custom class.
- Assume all elements of the set must be numbers.
---


**Implicit Requirements:**
- Must have a custom class CustomSet
  - with instance methods:
    - #initialize => accepts an array of numbers
    - #empty? => returns whether the set is empty
    - #contains? => returns whether the set contains the argument
    - #subset? => returns whether the calling set is a subset of the passed in set argument
    - #disjoint? => returns whether the calling set and the set argument share any elements
    - #eql? => returns whether the calling set and the set argument have the exact same, unique elements
    - #add => adds an element to the set
    - #== => returns whether the calling set and the set argument have the exact same, unique elements
    - #intersection => returns a new set with the shared elements of the calling set and the set argument
    - #difference => returns a new set with the elements in the calling set that do not appear in the set argument
    - #union => returns a new set with all of the unique elements from the calling set and the set argument

---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

See implicit requirements for what instance methods are needed & their functions.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See custom_set_test.rb for test cases.

---

Data Structure
--------------

CustomSet class:
- Using an array to contain the elements would allow access to Ruby's Array class & its methods.
@set => an array containing all elements of a set

---

Algorithm
---------

#subset?(other_set)
- iterate through @set.
  - If other_set does not include the current iteration element, return false.
- Return true

Code
----

=end

class CustomSet
  def initialize(arr = [])
    @set = arr.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set.include?(element)
  end

  def subset?(other_set)
    set.each do |element|
      return false if !other_set.contains?(element)
    end
    true
  end

  def disjoint?(other_set)
    set.each do |element|
      return false if other_set.contains?(element)
    end
    true
  end

  def eql?(other_set)
    set.uniq.sort == other_set.set.uniq.sort
  end

  def add(element)
    set << element
    set.uniq!
    self
  end

  def ==(other_set)
    eql?(other_set)
  end

  def intersection(other_set)
    new_set = CustomSet.new

    set.each do |element|
      new_set.add(element) if other_set.contains?(element)
    end

    new_set
  end

  def difference(other_set)
    new_set = CustomSet.new

    set.each do |element|
      new_set.add(element) unless other_set.contains?(element)
    end

    new_set
  end

  def union(other_set)
    new_set = other_set.dup

    set.each do |element|
      new_set.add(element)
    end

    new_set
  end

  protected

  attr_reader :set
end