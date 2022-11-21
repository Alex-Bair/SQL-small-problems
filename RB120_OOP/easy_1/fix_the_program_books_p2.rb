class Book
  attr_accessor :title, :author
  
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
Expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

=begin
Further Exploration

This way of creating and initializing book objects could be beneficial if:
- The book is still being developed (the author and/or title are subject to change)
- There are typos during data entry when creating a book object, and those typos need fixed.
- We need to account for having a certain quantity of books, and the title/author of the books does not matter.

It could be an issue to allow the title and author of the book to be changed easily by outside individuals. It would be better to only allow certain individuals to have the ability to change the book's title and author.

In the previous exercise, we create and initialize the book at the same time. This would ensure that every book has an author and title at the time of creation. This would also avoid allowing anyone to alter a book's title and/or author after creation & initialization.

=end