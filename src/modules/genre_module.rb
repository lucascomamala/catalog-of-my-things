require_relative 'utils'
# require_relative '../'

module GenreModule
  include Utils

  def list_genres
    if @genres.empty?
      puts "\nGenre list is empty."
    else
      puts "\n list of all genres:"
      @genres.each do |g|
        puts '{'
        puts " ID: #{g.id}"
        puts " Name: #{g.name}"
        puts '}'
      end
    end
  end
end
