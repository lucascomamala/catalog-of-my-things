class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name: 'unknown', last_name: 'unknown')
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_s
    { first_name: @first_name, last_name: @last_name }
  end
end
