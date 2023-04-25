class App
  def run
    puts "\nPlease choose an option by entering a number
        1 - List all books
        2 - List all music albums
        3 - List all games
        4 - List all genres
        5 - List all labels
        6 - List all authors
        7 - Add a book
        8 - Add a music album
        9 - Add a movie
        10 - Add a game
        11 - Exit"

    option = gets.chomp.to_i
    select_option(option)
  end

  def select_option(option)
    hash = {
      1 => :list_books,
      2 => :list_music,
      3 => :list_games,
      4 => :list_genres,
      5 => :list_labes,
      6 => :list_authors,
      7 => :add_books,
      8 => :add_music,
      9 => :add_movie,
      10 => :add_game,
      11 => :exit
    }
    chosen = hash[option]

    if chosen.nil?
      puts 'select a number from the list'
      show_options

    else
      send(chosen)
    end
  end
end
