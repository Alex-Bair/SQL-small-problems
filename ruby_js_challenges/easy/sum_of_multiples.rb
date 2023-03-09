=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
    Situation 1: Natural number and set of one or more numbers
    Situation 2: Natural number with no set of numbers. (Assume set of 3 and 5)
-  Output: Integer representing the sum of all multiples of numbers in the set that are less than the first natural number provided.

---

**Problem Domain:**
 Nothing specific. Natural numbers in this situation can be assumed to be positive integers.

---

**Explicit Requirements:**
- If the set of numbers is not provided, assume a default set of 3 and 5.
- The multiples to sum should be less than the input natural number.
---


**Implicit Requirements:**
- Must return an integer.
- Must have a class named SumOfMultiples.
- Must have a class method #to.
- Must have an instance method #to.
- Only unique multiples are summed.
---

**Clarifying Questions:**

1. Do we need to validate input?
  - No. Assume input will be valid.

---

**Mental Model:**

- SumOfMultiples class
  - Class method #to
    - Simply instantiates a new SumOfMultiples object and leverages the instance method #to
  - Instance method #to => performs conversion from input natural number to sum of multiples.
  - Instance method #multiples => returns an array of all valid multiples
  - Constant with a default array of 3 and 5 (the default set).
  
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

Natural number: 20
Set: 3, 5
=> The multiples of 3 or 5 are 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78.

See test cases in sum_of_multiples_test.rb.

---

Data Structure
--------------

See Mental Model.

@set = [3, 5]
input_natural_number = 20

Have DEFAULT_SET of [3, 5] within the SumOfMultiples class.

---

Algorithm
---------

#initialize
- Assign the input set to the instance variable @set. If no input is provided, assign @set to DEFAULT_SET

#multiples
- initialize an empty array to local variable 'mults'
- Iterate over @set. Call the block variable base_num.
  - Initialize current_multiple to the current element from @set.
  - Enter a loop
    - Break if current_multiple is equal to or greater than the input natural number.
    - Append current_multiple to 'mults'
    - Increment current_multiple by base_num.
- Return an array containing only the unique values in 'mults'

#to (instance method)
- Sum the return value of #multiples.


#to (class method)
- Instantiate a new SumOfMultiples object and call the instance method #to.

Code
----

=end

class SumOfMultiples
  DEFAULT_SET = [3, 5]
  
  def initialize(*nums)
    if nums.empty?
      @set = DEFAULT_SET
    else
      @set = nums
    end
  end

  def to(input_num)
    multiples(input_num).sum
  end

  def self.to(input_num)
    SumOfMultiples.new.to(input_num)
  end

  private

  def multiples(input_num)
    mults = []
    
    @set.each do |base_num|
      current_multiple = base_num
      loop do
        break if current_multiple >= input_num
        mults << current_multiple
        current_multiple += base_num
      end
    end
    
    mults.uniq
  end
end
