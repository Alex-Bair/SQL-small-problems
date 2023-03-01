=begin

In Ruby, constants have lexical scope. This means that Ruby will search in the code surrounding the constant reference, then up the inheritance chain, then the top level, for where the constant is defined.

Since the FORMAT constant is not defined in the File class (it's defined in the subclasses, which are not in the File class' lexical scope), we must specify where to look with the namespace operator ::.

We can use self.class::FORMAT to resolve this error and have Ruby lookup the FORMAT constant in whichever subclass calls the #to_s method.

=end

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post