ALPHANUMERIC_ARR = (0..9).to_a + ('a'..'z').to_a

def real_palindrome?(string)
  arr = string.downcase.split("")
  arr.select! {|x| ALPHANUMERIC_ARR.include?(x)}
  arr == arr.reverse
end

#LS Solution

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  string == string.reverse
end