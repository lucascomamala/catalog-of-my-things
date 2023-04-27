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

  # validation for spotify

  def onspotify_validation
    on_spotify = gets.chomp.downcase
    while on_spotify != 'y' && on_spotify != 'n'
      puts 'Invalid choice. Please try again (y/n): '
      on_spotify = gets.chomp.downcase
    end
    on_spotify == 'y'
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

  def genre_select(name)
    # Iterates through genres and returns the genre if found
    @genres.each do |g|
      return g if g.name.downcase == name.downcase
    end
    # If no genre was found, we create and return new one
    genre = Genre.new(name)
    @genres << genre
    genre
  end

  def label_select(title, color)
    # Iterates through labels and returns the label if found
    @labels.each do |l|
      return l if l.title.downcase == title.downcase && l.color.downcase == color.downcase
    end
    # If no label was found, we create and return new one
    label = Label.new(title, color)
    @labels << label
    label
  end
end
