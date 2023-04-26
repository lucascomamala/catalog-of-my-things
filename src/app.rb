require_relative 'menu'
require_relative 'modules/game_module'
require_relative 'modules/author_module'
require_relative 'associations/author'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'modules/music_module'
require_relative 'associations/genre'
require_relative 'modules/genre_module'

class App
  include Menu
  include GameModule
  include AuthorModule
  include BookModule
  include LabelModule
  include MusicModule
  include GenreModule

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
    5 => :list_labels,
    6 => :list_authors,
    7 => :add_book,
    8 => :add_music,
    9 => :add_movie,
    10 => :add_game,
    11 => 'exit'
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
