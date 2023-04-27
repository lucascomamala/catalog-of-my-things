require_relative 'utils'
require_relative '../associations/author'

module AuthorModule
  def list_authors
    puts 'Authors:'
    @authors.each_with_index do |a, i|
      puts " #{i + 1}) #{a.first_name} #{a.last_name}"
    end
    puts "\nPress Enter to return to main menu..."
    gets.chomp
  end
end
