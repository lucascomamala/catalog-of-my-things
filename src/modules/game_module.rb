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

    # Creates our genre, author and label objects and adds them to their respective instance arrays
    @authors.each do |a|
      author = if a.first_name == first_name && a.last_name == last_name
                 a
               else
                 Author.new(first_name: first_name, last_name: last_name)
               end
    end
    @authors << author unless @authors.include?(author)
    # genre = Genre.new(name: genre)
    # @genres << genre unless @genres.include?(genre)
    # label = Label.new(title: title, color: color)
    # @labels << label unless @labels.include?(label)
    game.author = author
    # game.genre = genre
    # game.label = label
    p game
    p @authors
  end
end
