
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)


# The method above will print [4, 5, 3, 6]
# https://docs.ruby-lang.org/en/3.1/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments