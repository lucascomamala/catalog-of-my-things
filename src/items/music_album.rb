require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify: false, publish_date: Date.today)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def to_s
    { on_spotify: @on_spotify, publish_date: @publish_date, archived: @archived }
  end

  private

  # Overwrite of can_be_archived? method
  # Returns true if the parent's method returns true AND if on_spotify equals true
  def can_be_archived?
    super() && @on_spotify == true
  end
end
