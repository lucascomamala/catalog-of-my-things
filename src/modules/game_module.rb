require 'date'
require_relative '../items/game'
require_relative '../associations/author'
require_relative 'utils'

module GameModule
  include Utils

  # rubocop:disable Metrics/MethodLength
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
    genre = genre_select(genre)
    game.genre = genre
    label = label_select(title, color)
    game.label = label

    # Adds our game object to our games array
    @games << game
  end

  def list_games
    if @games.empty?
      puts "\nNo added games yet! Please add some games."
    else
      puts "\nList of all games:"
      @games.each_with_index do |g, i|
        puts '{'
        puts "  Index: #{i + 1}"
        puts "  ID: #{g.id}"
        puts "  Title: #{g.label.title}"
        puts "  Color: #{g.label.color}"
        puts "  Genre: #{g.genre.name}"
        puts "  Author: #{g.author.first_name} #{g.author.last_name}"
        puts "  Multiplayer?: #{g.multiplayer}"
        puts "  Publish Date: #{g.publish_date}"
        puts "  Last Played At: #{g.last_played}"
        puts "  Archived: #{g.archived}"
        puts '}'
      end
    end

    puts "\nPress Enter to return to main menu..."
    gets.chomp
  end
  # rubocop:enable Metrics/MethodLength
end
