require_relative 'item'

class Book < Item
  attr_accessor :publisher, :title, :cover_state

  def initialize(title, publisher, cover_state, publish_date)
    super(publish_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_s
    { title: title, publisher: publisher, cover_state: cover_state, publish_date: publish_date }
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  private :can_be_archived?
end
