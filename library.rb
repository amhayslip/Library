class Library
  def initialize
    @books = []
  end

  def books
    @books
  end

  def list_books
    @books.each {|book| puts "The book #{book.title} is available"}
  end 

  def borrowed_books
    @books.each do |book| 
      if book.status == "unavailable"
        puts "The book #{book.title} has been checked out by "
      end
    end
  end

  def available_books
    @books.each do |book| 
      if book.status == "available"
        puts "#{book.title}"
      end
    end
  end

  def add_book(book)
    @books << book 
    puts "You added #{book.title} to the library!"
  end

  def check_out(user, book)

    if user.borrowed_books.length >= 2
      puts "Sorry, the user is only able to check out two books."
      return
    end
    
    if book.status == "available"
      user.borrowed_books << book
      book.status = "unavailable"
      book.borrower = user
    else
      puts "Sorry, that book is unavailable."
    end
  end

  def check_in(book)
    @book = book
  end
end

class Borrower 
  attr_accessor :borrowed_books
  def initialize(name)
    @name = name
    @borrowed_books = []
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
  attr_accessor :status, :borrower
  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end
end