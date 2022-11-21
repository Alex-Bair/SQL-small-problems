class Book
  attr_reader :title, :author
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


=begin
Expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

#Further Exploration

=begin

attr_reader - creates a getter method for the symbols passed in as arguments
attr_writer - creates a setter method for the symbols passed in as arguments
attr_accessor - creates both a setter and getter method for the symbols passed in as arguments

We used attr_reader instead of attr_writer or attr_accessor because we only needed the functionality to get the author and title of a book. We did not need to change the title or author of a book after instantiation.
Using ONLY attr_writer would not satisfy this problem, but using ONLY attr_accessor would satisfy the requirements (although we need to make sure having a setter method for author and title is ok).

If instead of attr_reader, we added the code below, the behavior would be identical. attr_reader is a bit of Ruby's syntactial sugar to create the two methods below without having to type all of it out.

The downside is that it's a bit more code and messier than simply using attr_reader, but it does allow us to more easily add additional functionality when reading the state of the title and author attributes if necessary later.

def title
  @title
end

def author
  @author
end

=end