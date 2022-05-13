=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: bill amount, tip percentage
-  Output: tip amount, total bill aomunt

---

**Problem Domain:**

---

**Implicit Requirements:**
- Must have $ in output.
- Must include cents in output.
---

**Clarifying Questions:**

1. Does the bill already include tax? Do we need to account for tax rates?
    Assume tax does not factor into bill or total bill.

---

**Mental Model:**

Get input from user for both bill and tip percentage. Perform calculations to get tip amount and total bill amount. Format results. Output formatted results to screen.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 200, 15
  -  Output: $30.0, $230.0

---

_Your Test Cases:_

-  Example 2
  -  Inputs: 100, 10.52
  -  Output: $15.20, $115.20

---

_Your Edge Cases:_

-  Example 4
  -  Inputs: 100, 0
  -  Output: $0.00, $100.00

---

Data Structure
--------------

Use floats for calculations.

---

Algorithm
---------

Get input from user.
Perform calculations.
Format results.
Output results to user.

Code
----

=end

bill = ''
tip_percent = ''

loop do
  puts "What's the bill amount in US dollars?"
  bill = gets.strip.chomp.to_f
  break if !bill.nil? && bill.positive?
  puts "Please enter a valid, positive number."
end

loop do
  puts "What's the tip percentage? (ex: 15%)"
  tip_percent = gets.strip.chomp.to_f / 100
  break if !tip_percent.nil? && !tip_percent.negative?
  puts "Please enter a valid, positive number."
end

tip_amount = bill * tip_percent
total_bill = bill + tip_amount

puts "The tip is $#{format("%.2f", tip_amount)}."
puts "The total bill is $#{format("%.2f", total_bill)}."