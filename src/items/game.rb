require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played

  def initialize(publish_date: Date.today, multiplayer: false, last_played: 'Unknown')
    super(publish_date: publish_date)
    @multiplayer = multiplayer
    @last_played = last_played
  end

  private

  # Overwrite of can_be_archived? method
  # Returns true if the parent is true AND last_played is greater than 2 years
  def can_be_archived?
    super() && Date.today.year - @last_played.year > 2
  end
end
