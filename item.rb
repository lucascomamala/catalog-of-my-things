require 'date'

class Item
  attr_reader :id
  attr_accessor :genre, :author, :label, :publish_date

  # Contrutor for Item object
  # Dates should saved as a Date object: Date.parse(YYYY/MM/DD)
  def initialize(genre: 'Unknown', author: 'Unknown', label: 'Unknown', publish_date: 'Unknown')
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    current_year - @publish_date.year > 10 ? true : false
  end
end
