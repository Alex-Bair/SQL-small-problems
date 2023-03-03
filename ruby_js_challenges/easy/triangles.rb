=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Create a Triangle class with a public Triangle#kind method that determines if the triangle is equilateral, isosceles, or scalene.


-  Inputs: A Triangle object
-  Output: A string representing 'equilateral', 'isosceles', or 'scalene'.

---

**Problem Domain:**

Equilateral triangles have three sides of equal length.
Isosceles triangles have two sides of equal length.
Scalene triangles have no sides of equal length.
Valid triangles must have sides with length > 0.
For valid triangles, the sum of the lengths of any two sides must be greater than the length of the third side.

---

**Explicit Requirements:**

- Triangle objects must be created with the syntax `Triangle.new(side1_length, side2_length, side3_length)`
- Triangle objects must have all side lengths be greater than 0.
- The sum of two sides' lengths of the Triangle object must be greater than the third side's length.

---


**Implicit Requirements:**

- Attempting to create an invalid Triangle object should raise an ArgumentError.
- Triangle#kind must return a string.

---

**Clarifying Questions:**

1. No questions right now.

---

**Mental Model:**

Create a custom Triangle class with the following methods:

PUBLIC INTERFACE

- #initialize => takes three arguments that represents the three sides of the Triangle, validates the three sides (throwing ArgumentError if not), then assigns the sides to an instance variable
- #kind => returns string representing whether the calling Triangle object is equilateral, isosceles, or scalene
 
PRIVATE HELPER METHODS

- #valid_side? => returns true if a side length is greater than zero, false otherwise
- #valid_triangle? => returns true if all sides are valid lengths AND the sum of the two smallest sides are greater than the largest side.
-


#### Likely only need two of the below three? ######
- #equilateral? => returns true if all sides are the same length, false otherwise
- #isosceles? => returns true if exactly two sides are the same length, false otherwise
- #scalene? => returns true if no sides are the same length, false otherwise

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See provided tests cases in file triangles_test.rb

---

Data Structure
--------------

Use an array to contain the side lengths of Triangle objects.
Examples:
[1, 2, 2.5]
[5, 5, 6]
[3, 3, 3]

Arrays can be sorted so the largest side is at the end of the array and accessible with Array#last

---

Algorithm
---------

#initialize
- Take three arguments, side1 side2 and side3
- Assign instance variable @sides to an array containing the three sides
- Validate that the sides form a valid triangle using #valid_triangle?. Throw an ArgumentError if invalid triangle.


#valid_triangle?
- Return true if:
  - #valid_sides? is true AND
  - the sum of the two smallest sides are greater than the largest side
- Return false otherwise

#valid_side?
- Return true if:
  - each side length is greater than 0

#kind
- Return 'equilateral' if #equilateral returns true
- Return 'scalene' if #scalene returns true
- Return 'isosceles' otherwise

#equilateral
- Return true if all three sides are the same length.
- Return false otherwise

#scalene
- Return true if all three sides are different lengths
- Return false otherwise


Code
----

=end

class Triangle
  def initialize(length1, length2, length3)
    @sides = [length1, length2, length3].sort
    raise(ArgumentError.new("Invalid triangle lengths")) unless valid_triangle?
  end
  
  def kind
    return 'equilateral' if equilateral?
    return 'scalene' if scalene?
    'isosceles'
  end
  
  private
  
  def valid_triangle?
    valid_sides? &&
      @sides[0, 2].sum > @sides.last &&
      @sides[1, 2].sum > @sides.first &&
      @sides[0] + @sides[2] > @sides[1]
  end
  
  def valid_sides?
    @sides[0].positive?
  end
  
  def equilateral?
    @sides.uniq.count == 1
  end
  
  def scalene?
    @sides.uniq.count == 3
  end
end
