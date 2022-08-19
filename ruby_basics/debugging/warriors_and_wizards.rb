# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player

=begin

On line 15, the player's character choice is assigned to the local variable input as a string object. The character_classes hash on lines 7-12 has symbol keys, not strings. This means that when we try accessing the value of the class chosen by the player, we try accessing the character_classes hash with a string instead of a symbol. This results in a return value of nil.
This can be resolved by adding the String#to_sym method at the end of line 15 when obtaining the player character choice.

However, the character stats are not updating after merging in the upgrade on line 15. This is because the Hash#merge method does not mutate the caller. The returned new hash with updated stats is not assigned to any accessible variable. When we output the player's stats on line 20, the un-upgraded stat spread is shown.
This can be resolved by using the mutating method Hash#merge!. This mutates the player hash and upgrades the appropriate stat based on the player's character choice.

=end