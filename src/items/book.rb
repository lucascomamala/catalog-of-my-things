require_relative 'item'

class Book < Item
  attr_accessor :publisher, :title

  def initialize(title, publisher, cover_state)
    super()
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  private :can_be_archived?
end
