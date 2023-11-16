require './book'
require'./rental'
require'./student'

require './book'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new book instance with title and author' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new rental for the book with specified person and date' do
      book = Book.new('To Kill a Mockingbird', 'Harper Lee')
      person = double('person')
      date = '2023-11-16'

      expect(Rental).to receive(:new).with(date, book, person)

      book.add_rental(person, date)
    end
  end

  describe '#to_json' do
    it 'converts the book object to JSON format' do
      book = Book.new('1984', 'George Orwell')
    #   book.rentals << double('rental', to_json: { 'rental_info' => 'info1' }.to_json)

      expected_json = {
        'title' => '1984',
        'author' => 'George Orwell',
        'rentals' => []
      }.to_json

      expect(book.to_json).to eq(expected_json)
    end
  end
end
