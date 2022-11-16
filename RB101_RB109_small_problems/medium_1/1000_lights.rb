=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: integer n (representing total number of swtiches)
-  Output: array (represents the light #s that are on after n repetitions )

---

**Problem Domain:**

There are n lights, all initially off.
We go through n iterations flipping the switch for each light. The 
We flip the switch on each iteration for all lights whose number is a multiple of that iteration number
  EX: iteration 1, all lights are flipped
      iteration 2, lights 2, 4, 6, 8, ... are flipped
      iteration 3, lights 3, 6, 9, 12, ... are flipped
      ...
      iteration n, light n is flipped
---

**Explicit Requirements:**
- Must return an array with integers sorted from lowest to highest.
- Returned integer only has light numbers that are on after n iterations.
---


**Implicit Requirements:**

---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Keep track of light status as an array of booleans. The index in the array will represent the light number minus 1.
Iterate from 1 to input number n. Flip the status of the light's with numbers that are multiples of the current iteration number.
Transform the boolean light status array into the corresponding light number for lights that are on.
Select only the elements that are integers to return in a new array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

light(2) == [1]
light(10) == [1, 4, 9]
light(5) == [1, 4]

---

Data Structure
--------------

Light status array = [false, false, false, false, ...]
Light number            1      2      3      4
Index                   0      1      2      3

Light number = index + 1

---

Algorithm
---------
- Initialize variable 'light_status_arr' to an array of n boolean falses. 
- Iterate from 1 to n. Call the block parameter 'num'
  - Initialize variable 'light_number' to 0.
  - Iterate through 'light_status_arr' array and destructively transform it. Call the block parameter 'light_status'
    - Increment 'light_number' by 1.
    - Flip 'light_status' at 'light_number' % 'num' == 0 (evenly divisible)
- Initialize variable 'lights_on' to an empty array.
- Iterate through 'light_status_arr'.
  - If the current element in 'light_status_arr' is true, append the element's index + 1 to the 'lights_on' array.


Code
----

=end

def light(n)
  light_status_arr = []
  n.times do 
    light_status_arr << false
  end
  
  1.upto(n) do |num|
    light_number = 0
    light_status_arr.map! do |light_status|
      light_number += 1
      if light_number % num == 0
        !light_status
      else
        light_status
      end
    end
  end

  lights_on = []
  light_status_arr.each_with_index do |light_status, index|
    lights_on << (index + 1) if light_status
  end
  lights_on
end

p light(2) == [1]
p light(10) == [1, 4, 9]
p light(5) == [1, 4]

#Further Exploration
=begin
Further Exploration # 1:

After revisiting this problem, I figured out why each light that's on is a perfect square. Factors of the light number can be thought of as on-off pairs - one turns the light on, while the other turns the light off. As long as both factors in the pair are unique, there is no impact to the ending status due to the two factors. 

Non-perfect squares have an even number of unique positive integer factors, meaning they will be off after n iterations.

Ex: 

2 has two factors: 1, 2

3 has two factors: 1, 3

6 has four factors: 1, 2, 3, 6

12 has six factors: 1, 2, 3, 4, 6, 12

The lights that remain on are perfect squares because they have an odd number of unique positive integer factors.

Ex: 

1 has a single factor: 1

4 has three factors: 1, 2, 4

9 has three factors: 1, 3, 9

16 has five factors: 1, 2, 4, 8, 16   

=end

def light_description(n)
  lights_on = light(n)
  lights_off = []
  1.upto(n) do |num|
    lights_off << num if !lights_on.include?(num)
  end
  
  lights_off[-1] = "and #{lights_off[-1]} are now off; "
  lights_on[-1] = "and #{lights_on[-1]} are on."
  on_string = lights_on.join(', ')
  off_string = lights_off.join(', ')
  
  p 'lights ' + off_string + on_string
end

light_description(10)