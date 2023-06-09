require_relative 'menu'
require_relative 'modules/game_module'
require_relative 'modules/author_module'
require_relative 'associations/author'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'modules/music_module'
require_relative 'associations/genre'
require_relative 'modules/genre_module'
require_relative 'modules/utils'

require 'json'
require_relative 'storage/storage'

class App
  attr_accessor :books, :labels

  include Menu
  include GameModule
  include AuthorModule
  include BookModule
  include LabelModule
  include MusicModule
  include GenreModule
  include Storage

  def initialize
    @labels = load_labels || []
    @genres = load_genres || []
    @authors = load_authors || []
    @games = load_games || []
    @music_albums = load_music || []
    @books = load_books || []
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
    9 => :add_game,
    10 => 'exit'
  }.freeze

  def run
    show_options
    option = gets.chomp.to_i

    while option != 10
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
