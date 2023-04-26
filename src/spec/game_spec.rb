require_relative '../items/game'

RSpec.describe Game do
  before(:all) do
    @game = Game.new(publish_date: Date.parse('2010/1/1'), multiplayer: false, last_played: Date.parse('2020/1/1'))
  end

  describe '#new' do
    it 'should initialize the game class' do
      expect(@game).to be_an_instance_of(Game)
    end
  end

  describe '#can_be_archived?' do
    it "should return true if parent's method returns true AND if last_played_at is older than 2 years" do
      expect(@game.send(:can_be_archived?)).to be_truthy
    end

    it 'should return false if last_played_at is younger than 2 years' do
      @game.last_played = Date.today
      expect(@game.send(:can_be_archived?)).to be_falsey
    end

    it 'should return false if publish_date is younger than 10 years' do
      @game.last_played = Date.parse('2020/1/1')
      @game.publish_date = Date.parse('2019/1/1')
      expect(@game.send(:can_be_archived?)).to be_falsey
    end
  end
end
