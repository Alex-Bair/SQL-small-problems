
for i in 1..99 do
  puts i if i % 2 != 0
end

# Further exploration

1.upto(99) {|i| puts i if i.odd?}

arr = (1..99).select {|i| i.odd?}
puts arr