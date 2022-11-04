arr = ["9", "8", "7", "10", "11"]
p ( arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
  )

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 

# Precedence (order of evaluation) was the issue with Josh's code. The binding between #p and  `arr.sort` was tighter than the binding between `arr.sort` and the block argument delimited by `do..end` on lines 2 - 4.
# This essentially means that the block was not passed into the Array#sort invocation. To fix this, we can control the evaluation order by encompassing the Array#sort method invocation, the calling object `arr`, and the passed in block argument with parentheses.
# This will fix the precedence and binding issue Josh had.