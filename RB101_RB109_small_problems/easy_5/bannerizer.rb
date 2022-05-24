=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: short string
-  Output: Print text within a box.

---

**Problem Domain:**

---

**Implicit Requirements:**
- The input string should be placed into a box.
- Assume input will always fit in the terminal window.
- Empty string will generate an empty box of width 2.
- The string in the box should be padded with spaces.
- Box height should be 3 lines.
---

**Clarifying Questions:**

1. None. Examples clarify requirements.

---

**Mental Model:**

- Determine length of string.
- Determine width of box.
- Output top two lines of box.
- Output middle line of box with string.
- Output bottom two lines of box.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+


print_in_box('')
+--+
|  |
|  |
|  |
+--+

---

Data Structure
--------------
- Use strings for manipulation. No other data structures needed.
---

Algorithm
---------
- Determine length of input string.
- Calculate width of box (input string length + 2).
- Output top border of box.
- Output top blank line of box.
- Output middle line of box with text.
- Output bottom blank line of box.
- Output bottom border of box.



Code
----

=end

def box_border(box_width)
  border = "+#{"-" * box_width}+"
  puts border
end

def empty_box_edges(box_width)
  edge = "|#{" " * box_width}|"
  puts edge
end


def print_in_box(input)
  box_width = input.length + 2
  box_border(box_width)
  empty_box_edges(box_width)
  puts "| #{input} |"
  empty_box_edges(box_width)
  box_border(box_width)
end

#Further Exploration

#Truncated message version

MAX_LINE_LENGTH = 76.0


def print_in_box(input)
  unless input.length > MAX_LINE_LENGTH
    box_width = input.length + 2
  else
    input = input[0, MAX_LINE_LENGTH]
    box_width = MAX_LINE_LENGTH + 2
  end
  box_border(box_width)
  empty_box_edges(box_width)
  puts "| #{input} |"
  empty_box_edges(box_width)
  box_border(box_width)
end

input = "The big, brown cat went hiking in the mountains with it's friend, famous DJ Porter Robinson. They had a great time! :D"
print_in_box(input)

# Word wrapping long messages

def determine_box_width(input)
  input.length > MAX_LINE_LENGTH ? MAX_LINE_LENGTH + 2 : input.length + 2
end

def determine_final_line_justification(input)
  if input.length > MAX_LINE_LENGTH
    MAX_LINE_LENGTH
  else
    input.length
  end
end

def display_word_wrapped_input(input)
  rows = (input.length / MAX_LINE_LENGTH).ceil
  final_line_justification = determine_final_line_justification(input)
  rows.times do
    puts "| #{input.slice!(0, MAX_LINE_LENGTH).ljust(final_line_justification, " ")} |"
  end
end

def print_in_box(input)
  box_width = determine_box_width(input)
  box_border(box_width)
  empty_box_edges(box_width)
  display_word_wrapped_input(input)
  empty_box_edges(box_width)
  box_border(box_width)
end

print_in_box(input)