require './classroom'
require './book'
require './person'

RSpec.describe Rental do
  let(:date) { '2023-11-16' }
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(33, 'Tshepo') }
  subject { described_class.new(date, book, person) }

  describe '#initialize' do
    it 'creates a new rental with specified date, book and person' do
      expect(subject.date).to eq(date)
      expect(subject.book).to eq(book)
      expect(subject.person).to eq(person)
    end

    it 'adds the rentals to book and person' do
      expect(book.rentals).to include(subject)    
      expect(person.rentals).to include(subject)    
    end
  end

  describe '#to_h' do
    it 'returns the hash representation of the rental' do
      expected_hash = {
        _class: 'Rental',
        object_id: subject.object_id,
        date: date,
        book: book,
        person: person
      }
    end
  end
end