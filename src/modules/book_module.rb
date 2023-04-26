require_relative '../items/book'

module BookModule
  def add_book
    print 'Title: '
    title = gets.chomp

    print 'Publisher: '
    publisher = gets.chomp

    print 'Cover State(good/bad): '
    cover_state = gets.chomp.downcase

    book = Book.new(title, publisher, cover_state)
    @books << book

    puts 'Book added successfully'
  end

  def list_books
    puts 'No books added yet! Please add some books' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Publisher: #{book.publisher}" }
  end
end
