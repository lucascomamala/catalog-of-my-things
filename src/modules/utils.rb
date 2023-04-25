module Utils
  def date_validation
    begin
      date = Date.parse(gets.chomp)
    rescue ArgumentError
      puts 'Invalid date format. Please try again (YYYY/MM/DD): '
      retry
    end
    date
  end

  def bool_validation
    multiplayer = gets.chomp.downcase
    while multiplayer != 'y' && multiplayer != 'n'
      puts 'Invalid choice. Please try again (y/n): '
      multiplayer = gets.chomp.downcase
    end
    multiplayer == 'y'
  end

  def author_select(first_name, last_name)
    # Iterates through our authors array and returns the author if found
    @authors.each do |a|
      return a if a.first_name.downcase == first_name.downcase && a.last_name.downcase == last_name.downcase
    end
    # If no author was found, we create and return new one
    author = Author.new(first_name: first_name, last_name: last_name)
    @authors << author
    author
  end
end
