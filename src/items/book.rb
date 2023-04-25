require './item'

class Book < Item
  attr_accessor :publisher, :name

  def initialize(name, publisher, cover_state)
    super()
    @name = name
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  private :can_be_archived?
end
