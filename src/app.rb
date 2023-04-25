require_relative 'menu'
require_relative 'modules/game_module'
require_relative 'modules/author_module'
require_relative 'associations/author'
require_relative 'storage'

class App
  include Menu
  include GameModule
  include AuthorModule

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
    10 => :add_game,
    11 => 'exit'
  }.freeze

  def run
    show_options
    option = gets.chomp.to_i

    # Infinite loop until user selects exit
    while option != 11
      select_option(option)
      show_options
      option = gets.chomp.to_i
    end

    # Save data once exit has been selected
    save_all_data
  end

  def save_all_data
    Storage.save_data('games', @games) unless @games.empty?
    Storage.save_data('authors', @authors) unless @authors.empty?
    Storage.save_data('music_albums', @music_albums) unless @music_albums.empty?
    Storage.save_data('genres', @genres) unless @genres.empty?
    Storage.save_data('labels', @labels) unless @labels.empty?
    Storage.save_data('books', @books) unless @books.empty?
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
