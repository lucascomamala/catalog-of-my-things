require 'date'
require_relative '../items/game'
require_relative '../associations/author'

module GameModule
  def add_game
    puts "Enter game publish date (YYYY/MM/DD): "
    publish_date = gets.chomp
    puts "Is it a multiplayer game (y/n): "
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y' ? true : false
    puts "Enter the last time you played the game (YYYY/MM/DD): "
    last_played = gets.chomp
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
  end
end
