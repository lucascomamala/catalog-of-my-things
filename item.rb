require 'date'

class Item
  attr_reader :id
  attr_accessor :genre, :author, :label, :publish_date

  # Constructor for Item object
  # Dates should saved as a Date object: Date.parse(YYYY/MM/DD)
  def initialize(genre: 'Unknown', author: 'Unknown', label: 'Unknown', publish_date: 'Unknown')
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  # Archives our item if the private method returns true
  # Doesn't return anything
  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has been archived'
    else
      puts 'Item cannot be archived yet'
    end
  end

  private

  # Returns true if publish date is greater than 10 years
  def can_be_archived?
    current_year = Date.today.year
    current_year - @publish_date.year > 10
  end
end
