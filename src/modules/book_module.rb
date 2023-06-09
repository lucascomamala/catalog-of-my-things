require_relative '../items/book'

module BookModule
  def add_book
    print 'Title: '
    title = gets.chomp

    print 'Publisher: '
    publisher = gets.chomp

    print 'Cover State (good/bad): '
    cover_state = gets.chomp.downcase

    print 'Publish Date (YYYY/MM/DD): '
    publish_date = gets.chomp.to_s

    book = Book.new(title, publisher, cover_state, publish_date)
    @books << book

    puts 'Book added successfully'
  end

  def list_books
    puts 'No Books added yet! Please add some books' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Publisher: #{book.publisher}, Cover State: #{book.cover_state.upcase}, Publish Date: #{book.publish_date}"
    end
  end
end
