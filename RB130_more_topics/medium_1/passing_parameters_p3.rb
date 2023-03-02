items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


# 1
gather(items) do |*produce, grains |
  puts produce.join(', ')
  puts grains
end

# 2
gather(items) do | fruit, *vegetables, grain |
  puts fruit
  puts vegetables.join(', ')
  puts grain
end

# 3
gather(items) do | fruit, *remainder |
  puts fruit
  puts remainder.join(', ')
end

# 4
gather(items) do | fruit, starch, root, grain |
  puts "#{fruit}, #{starch}, #{root}, and #{grain}"
end