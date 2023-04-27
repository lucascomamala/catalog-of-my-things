require 'date'

class Item
  attr_reader :id, :genre, :author, :label
  attr_accessor :publish_date, :archived

  # Constructor for Item object
  # Dates should saved as a Date object: Date.parse(YYYY/MM/DD)
  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  # Custom setters for our properties in the 1-to-many relationsips
  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
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
