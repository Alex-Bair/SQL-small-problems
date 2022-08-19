def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

=begin

The predict_weather method always outputs "Today's weather will be sunny!" because it can only select/sample from two string objects on line 2. 
String objects are truthy, so the if clause on lines 4-5 of the if-else statement is always evaluated and the else clause on lines 6-7 is ignored. 
This can be fixed by changing the strings within the sampled array on line 2 into the Boolean true and false objects.

=end

def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end