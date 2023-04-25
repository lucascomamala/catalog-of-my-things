require 'date'
require_relative '../items/game'
require_relative '../associations/author'
require_relative 'utils'

module GameModule
  include Utils

  def add_game
    # Gets publish date and validates it
    puts 'Enter game publish date (YYYY/MM/DD): '
    publish_date = date_validation

    # Gets multiplayer bool and validates it
    puts 'Is it a multiplayer game (y/n): '
    multiplayer = bool_validation

    # Gets last played date and validates it
    puts 'Enter the last time you played the game (YYYY/MM/DD): '
    last_played = date_validation

    # Gets genre, author and label
    puts 'Enter the game genre: '
    genre = gets.chomp
    puts 'Enter game creator first name: '
    first_name = gets.chomp
    puts 'Enter game creator last name: '
    last_name = gets.chomp
    puts 'Enter the game label title: '
    title = gets.chomp
    puts 'Enter the game label color: '
    color = gets.chomp

    # Creates our game object
    game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played: last_played)

    # Selects our genre, author and label objects (or creates them if they don't exist) and sets them in out game object
    author = author_select(first_name, last_name)
    game.author = author

    # TODO: Label and Genre

    # Adds our game object to our games array
    @games << game
  end
end
