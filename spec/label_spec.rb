require_relative '../src/associations/label'
require_relative '../src/items/book'

describe Label do
  before(:each) do
    @book = Book.new('Fault in our Stars', 'John Green', 'bad')
    @label = Label.new('Book-label', 'Blue')
  end

  describe '#new' do
    it 'should inialize the label class' do
      expect(@label).to be_an_instance_of(Label)
    end
  end

  describe '#add_item' do
    it 'adds the item in the array' do
      @label.add_item(@book)
      expect(@label.items[0]).to eq @book
    end
  end
end
