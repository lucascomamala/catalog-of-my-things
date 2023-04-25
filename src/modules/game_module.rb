require 'date'
require_relative '../items/game'
require_relative '../associations/author'

module GameModule
  def add_game
    p @authors
    # Gets publish date and validates it
    puts "Enter game publish date (YYYY/MM/DD): "
    begin
      publish_date = Date.parse(gets.chomp)
    rescue ArgumentError
      puts "Invalid date format. Please try again (YYYY/MM/DD): "
      retry
    end
    # Gets multiplayer bool and validates it
    puts "Is it a multiplayer game (y/n): "
    multiplayer = gets.chomp.downcase
    while multiplayer != 'y' && multiplayer != 'n'
      puts "Invalid choice. Please try again (y/n): "
      multiplayer = gets.chomp.downcase
    end
    multiplayer = multiplayer == 'y' ? true : false
    # Gets last played date and validates it
    puts "Enter the last time you played the game (YYYY/MM/DD): "
    begin
      last_played = Date.parse(gets.chomp)
    rescue ArgumentError
      puts "Invalid date format. Please try again (YYYY/MM/DD): "
      retry
    end
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

    # Creates our game object and its it to our @games instance array
    game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played: last_played)
    @games << game
  end
end
