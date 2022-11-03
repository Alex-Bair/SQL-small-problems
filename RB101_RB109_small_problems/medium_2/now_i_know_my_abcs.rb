=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: boolean representing if the input string can be spelled with the spelling blocks provided

---

**Problem Domain:**

Spelling blocks are broking into the following groups:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

Each letter in each block can only be used once.

---

**Explicit Requirements:**
- Each letter in each block can only be used once.
---


**Implicit Requirements:**
- Method should be named #block_word?
- Letter case does not matter (case insensitive)
---

**Clarifying Questions:**

1. Can letters be repeated? Example: would 'apple' return true?
  No. 

---

**Mental Model:**

Iterate through the letters in the input string. 
If the iteration's letter has not been used yet (i.e. the block_tracker hash's value for the associate key is false), flip the block_tracker hash's associated value to true. 
Otherwise, return false.
If all iterations complete without returning false, return true.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

---

Data Structure
--------------

Track which blocks are used with a hash. The keys are strings of each character on the block. The value will be a boolean representing if the block has been used. Initially all values will be false, but a value will be toggled to true once a character on the associated block is used.

block_tracker = {
  'bo' => false,
  'xk' => false,
  'dq' => false,
  etc..
}

Create block_tracker_keys array to convert from letter in string to the appropriate hash key.

block_tracker_keys = ['bo', 'xk', 'dq', etc...]

---

Algorithm
---------

- Create block tracker hash with a default value of false. Assign to variable 'block_tracker'.
- Create array with the keys from 'block_tracker'. Assign to variable 'block_tracker_keys'
- Iterate through the input string's letters case insensitively:
  - Determine the appropriate 'block_tracker' hash key from the 'block_tracker_keys' array. Assign to variable 'key'.
  - If 'block_tracker[key]' is false, set it to true. Otherwise, return false.
- Return true.

Code
----

=end

def block_word?(str)
  block_tracker_keys = %w(bo xk dq cp na gt re fs jw hu vi ly zm)
  
  block_tracker = Hash.new(false)
  
  str.downcase.split('').each do |letter|
    key = nil
    block_tracker_keys.each do |block|
      if block.include?(letter)
        key = block
      end
    end
    
    if block_tracker[key]
      return false
    else
      block_tracker[key] = true
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

#LS Solution
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end