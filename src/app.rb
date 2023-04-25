require_relative 'menu'

class App
  include Menu

  def initialize
    @games = []
    @music_albums = []
    @books = []
    @genres = []
    @labels = []
    @authors = []
  end

  HASH = {
    1 => :list_books,
    2 => :list_music,
    3 => :list_games,
    4 => :list_genres,
    5 => :list_labes,
    6 => :list_authors,
    7 => :add_books,
    8 => :add_music,
    9 => :add_movie,
    10 => :add_game
  }.freeze

  def run
    show_options
    option = gets.chomp.to_i

    while option != 11
      select_option(option)
      show_options
      option = gets.chomp.to_i
    end
  end

  def select_option(option)
    chosen = HASH[option]
    if chosen.nil?
      puts 'Invalid choice!'
    else
      send(chosen)
    end
  end
end
