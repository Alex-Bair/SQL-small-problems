def compute
  return "Does not compute." unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration

def compute(input)
  return "Does not compute." unless block_given?
  yield(input)
end

p compute("No block given!")
p compute("Block given!") {"This is the block!"}
p compute("Block given!") {|x| "The string '#{x}' was passed in as an argument!"}