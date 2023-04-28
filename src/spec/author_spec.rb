require_relative '../associations/author'
require_relative '../items/item'

RSpec.describe Author do
  before(:all) do
    @author = Author.new(first_name: 'John', last_name: 'Green')
  end

  describe '#new' do
    it 'should initialize the author class' do
      expect(@author).to be_an_instance_of(Author)
    end
  end

  describe '#add_item' do
    it 'should add an item to the array' do
      item = Item.new(Date.parse('2020/1/1'))
      @author.add_item(item)
      expect(@author.items[0]).to eq item
    end
  end
end
