class Library
# Sets the instance variable, @books to an empty array once a new instance
# of the library class is created. Made it an instance variable so it would
# be avaiable in other methods.
  def initialize  
    @books = []
  end
# books is a getter method that retrieves the values of the instance
# variable @books
  def books    
    @books
  end
# A method that will list each available book in the @books array.
  def list_books
    @books.each {|book| puts "The book #{book.title} is currently #{book.status}"}
  end 
# A methods that will list all the books that have been checked out 
# checked them out. 
  def borrowed_books
    @books.each do |book| 
      if book.status == "unavailable"
# book refers to an instance of the class "book". .title refers to the
# "getter" method we created in class Book that retrieves the value of
# instance variable, @title, which was passed a value from an instance of 
# the class Book.
# .borrower refers to the "getter/setter" method(s) which retrieve and set
# the value of @borrower is set in the check_out method (set to user)
        puts "The book #{book.title} has been checked out by #{book.borrower.name}"
      end
    end
  end

# Iterates through the @books array and checks each book's status. If the book's status is
# available, it puts the book (instance of the book class stored in the @books array) and
# calls the .title method (which retrieves the book's title which was passed in through
# through the class Books('s') initialize method).
  def available_books
    @books.each do |book| 
      if book.status == "available"
        puts "#{book.title}"
      end
    end
  end

# A methods that takes a parameter of book and adds it the @books array and outputs a message
# that you've added the book (which refers to an instance of th class Book) with it's title
# (which refers to the .title method that was created in the book class to retrieve that value
# of the instance variable, @title, which was set as a paratmenter when a new instance of the 
# Book class was created).
  def add_book(book)
    @books << book 
    puts "You added #{book.title} to the library!"
  end

# A method of the library class which allows library objects to check out books and pass in user(s)
# and book(s) (instances of the class Book) as parameters.
# In the "if" statement, user refers to the user parameter that is passed in when .check_out is
# called on library (an instance of the Library class).  Book refers to the parameter that is 
# passed to the check_out method and defined as an instance of the book class. 
  def check_out(user, book)
# .borrowerd_books refers to the "getter/setter" methods defined in the Borrower class which enables
# us to retrieve the books in the @borrowed_books array and add new ones as well. .length checks the
# length of the the @borrowered_books array.
    if user.borrowed_books.length >= 2
#
      puts "Sorry, the user is only able to check out two books."
      return
    end
# .status refers to the "getter/setter" method that retrieves and sets the instance variable @status. 
    if book.status == "available"
      user.borrowed_books << book
      book.status = "unavailable"
      book.borrower = user
    else
      puts "Sorry, that book is unavailable."
    end
  end

# Method that is called by instances of the Library class. Takes an attriubte of book and sets it the the
# @book instance variable. 
  def check_in(book)
    @book = book
  end
end

class Borrower 
# START HERE
  attr_accessor :borrowed_books
  def initialize(name)
    @name = name
    @borrowed_books = []
    @egrterggtgtet = 3
    puts "#{name} is the new borrower."
  end

  def name
    @name
  end

  def borrowed_books_count
    return @books.length
  end

  def borrowed_books_list
    borrowed_books.each do |bk|
      puts "#{bk.title}"
    end
  end
end 

class Book
  attr_reader :title, :author
# Creates "getter" methods that allow us to retrieve the values of 
# instance variables, @title and @author. But we cannot set them.
  attr_accessor :status, :borrower
# Creates "getter" and "setter" methods that allow us to retrieve
# and set the values of instance variables, @status and @borrower  
  def initialize(title, author)
# stores title and author as instance variables
    @title = title 
    @author = author
# sets instance variables, @status and @borrower, to default values.
    @status = "available"
    @borrower = nil
  end
end

