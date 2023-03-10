=begin

PEDAC Template
==============

(Understand the) Problem
------------------------



-  Inputs: 
    Meetup object instantiation =>two numbers representing a month (1-12) and a year
    Meetup#day method => two strings representing a day (ex: "Monday") and the descriptor for the schedule (ex: "first")
-  Output: A Date object with the appropriate date in the specified month and year.

---

**Problem Domain:**

Descriptors can be:
'first'
'second'
'third'
'fourth'
'fifth'
'last'
'teenth' - this refers to either the 13th, 14th, 15th, 16th, 17th, 18th, or 19th

There will not always be a fifth day of every month.

Days of the weeks will be given by 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'

---

**Explicit Requirements:**

- The case of the strings do not matter (case insensitive)
- Program should determine the specified meetup date.

---


**Implicit Requirements:**
- Must have a custom Meetup class
- Must have a Meetup#initialize method
- Must have a Meetup#day method
  - Must return a Date.civil object.
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Meetup class
  TEENTHS => an array of integers representing 13 - 19 (AKA the teenths)
  #initialize => take two arguments, initialize @date to a Date.Civil object at the first day of the given month & year.
  #day => takes two arguments, adjusts @date to the appropriate day in the month
  #find_first_x_day => increments @date to the first "-day" in the month.
  #find_meetup => increments @date to the appropriate meetup date based on the two string arguments

Date class helper methods
  #monday?
  #tuesday?
  #wednesday?
  #thursday?
  #friday?
  #saturday?
  #sunday?
  #next_day
  #day
  #month

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See examples in meetups_test.rb

---

Data Structure
--------------

Meetup class
  TEENTHS = array containing 13 - 19
  @date - Date.civil of the input year and month
  
Contain the date information within a Date object. Use Date methods to query and adjust @date.

---

Algorithm
---------

#day
- destructively downcase the input strings
- call #find_meetup and pass in the "-day" string and the descriptor string
- return @date

#find_first_x_day(day_str)
- Enter a loop
  - Check if @date is the day represented by the input string,
    - If so, break out of the loop.
    - If not, increment @date by 1.
    
#find_last_x_day(day_str)
- Set @date to the next month.
- Decrement @date by 1
- Enter a loop
  - Check if @date is the day represented by the input string,
    - If so, break out of the loop.
    - If not, decrement @date by 1.

#find_meetup(desc_str)
- If desc_str asks for the last day, call #find_last_x_day(day_str) and return out of the method.
- call #find_first_x_day and pass in the "-day" string
- Initialize local variable 'counter' to 1.
- Enter a loop
  - If the condition specified by the desc_str is met, break out of the loop.
    - 'counter' is keeping track of which '-day' is currently represented by @date
  - If not, increment @date by 7 days and increment 'counter' by 1.
  
#correct_day_of_week?(day_str)
- returns a boolean representing if @date is the date represented by day_str
  
Code
----

=end

require 'date'

class Meetup
  TEENTHS = (13..19).to_a
  CONVERT_DESC_TO_NUM = {
    first: 1,
    second: 2,
    third: 3,
    fourth: 4,
    fifth: 5
  }

  def initialize(y, m)
    @date = Date.civil(y, m)
    @start_month = m
  end

  def day(day_str, desc_str)
    day_str.downcase!
    desc_str.downcase!

    find_meetup(day_str, desc_str)

    return nil if @start_month != @date.month
    
    @date
  end

  private

  def find_meetup(day_str, desc_str)
    if desc_str == 'last' 
      find_last_x_day(day_str)
      return
    end

    find_first_x_day(day_str)
    counter = 1

    loop do
      break if meetup_found?(desc_str, counter)
      @date += 7
      counter += 1
    end
  end

  def meetup_found?(desc_str, counter)
    case desc_str
    when 'teenth' then TEENTHS.include?(@date.day)
    else
      counter == CONVERT_DESC_TO_NUM[desc_str.to_sym]
    end
  end

  def correct_day_of_week?(day_str)
    case day_str
    when 'monday'    then @date.monday?
    when 'tuesday'   then @date.tuesday?
    when 'wednesday' then @date.wednesday?
    when 'thursday'  then @date.thursday?
    when 'friday'    then @date.friday?
    when 'saturday'  then @date.saturday?
    when 'sunday'    then @date.sunday?
    end
  end

  def find_first_x_day(day_str)
    loop do
      break if correct_day_of_week?(day_str)
      @date += 1
    end
  end

  def find_last_x_day(day_str)
    @date = (@date.next_month - 1)
    loop do
      break if correct_day_of_week?(day_str)
      @date -= 1
    end
  end
end
