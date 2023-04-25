require_relative '../src/items/book'

describe Book do
  before(:each) do
    @book = Book.new('Fault in our Stars', 'John Green', 'bad')
  end

  describe '#new' do
    it 'should inialize the book class' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true for bad cover state or if parent returns true' do
      expect(@book.send(:can_be_archived?)).to be_truthy
    end
  end
end
