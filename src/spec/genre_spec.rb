require_relative '../associations/genre'
require_relative '../items/item'

RSpec.describe Genre do
  before(:all) do
    @genre = Genre.new(name: 'Emma')
  end

  describe '#new' do
    it 'should initialize the genre class' do
      expect(@genre).to be_an_instance_of(Genre)
    end
  end

  describe '#add_item' do
    it 'should add an item to the array' do
      item = Item.new(Date.parse('2022/2/5'))
      @genre.add_item(item)
      expect(@genre.items[0]).to eq item
    end
  end
end
