class Item
  attr_reader :id
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(genre: 'Unknown', author: 'Unknown', label: 'Unknown', publish_date: 'Unknown')
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end
end
