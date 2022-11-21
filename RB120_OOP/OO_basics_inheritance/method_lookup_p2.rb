class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

=begin

Method lookup path when calling the #color method on the #cat1 object.

Cat
Animal
Object
Kernel
BasicObject

The #color method is not found in the method lookup path, so an undefined method error is thrown.

=end