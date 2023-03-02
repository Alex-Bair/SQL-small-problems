# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}


=begin

Group 1: PROCS
- Procs can be created with the `proc` keyword or with Proc.new.
- Calling #to_s on a Proc returns an encoding of the Proc object.
- Calling #class on a Proc returns Proc
- Calling #call with no arguments on a Proc will execute (?) the Proc, regardless of whether the Proc has a block parameter defined. Block parameters will be assigned to nil.
- Calling #call with the proper number of arguments on a Proc will execute the Proc.

Group 2: LAMBDAS
- Lambdas can be created with the `lambda` keyword or the `->` lambda operator
- Calling #to_s on a Lambda returns an encoding of the Proc object, but with a '(lambda) designation at the end.'
- Lambdas are instances of the Proc class.
- Lambdas have strict arity - they must be passed the number of arguments they are expecting
- Lambdas are NOT a class and cannot be created with Lambda.new.

Group 3: METHODS
- Methods use the `yield` keyword to pass control (and potentially objects) to blocks.
- If a method encounters the `yield` keyword, it will throw a LocalJumpError if a block was not passed into the method.
- Using `yield` does not automatically pass the method's arguments to the block - the specific arguments must be explicitly listed after `yield`.
- Block parameters will be assigned to `nil` if argments are not passed from the method via `yield`.

Group 4: METHODS
- `yield` in methods can pass objects to the block, but the objects must be passed in like `yield(obj)`
- Blocks passed into methods have lenient arity - they can have fewer or more block parameters than are passed into them.
- Blocks do NOT see the local variable names used to pass in arguments via `yield`. They must have block parameters defined in order to access the arguments passed in from the method via `yield`.

FINAL ANALYSIS

PROCS:
- Can be created with the `proc` keyword.
- Procs have lenient arity.

LAMBDAS:
- Can be created with the `lambda` keyword or the `->` lambda operator.
- Lambdas are objects of the Proc class.
- Lambdas have strict arity.

BLOCKS:
- Blocks have lenient arity.
- Methods utilizing `yield` must have a block passed into them (unless `yield` is never encountered in the method execution, like with the #block_given? standard guard clause strategy)
- Blocks are groupings of code, a type of closure, not an Object.

=end