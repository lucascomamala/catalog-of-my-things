require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date: publish_date)
    @on_spotify = on_spotify
  end

  private

  # Overwrite of can_be_archived? method
  # Returns true if the parent's method returns true AND if on_spotify equals true
  def can_be_archived?
    super() && @on_spotify == true
  end
end
