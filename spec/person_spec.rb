require './person'
require './rental'
require './book'

RSpec.describe Person do
  let(:age) { 20 }
  let(:name) { 'Dumisani' }
  let(:parent_permission) { true }
  subject { described_class.new(age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'creates an instance of person with age, name and parent permission' do
      expect(subject.age).to eq(age)
      expect(subject.name).to eq(name)
      expect(subject.rentals).to be_empty
    end

    it 'it generated a random ID between 1 and 1000' do
        expect(subject.id).to be_between(1, 1000).inclusive
    end
  end

  describe '#correct_name' do
    it 'returns the name as it is' do
        expect(subject.correct_name).to eq(name)
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      let(:age) { 25 }

      it 'returns true' do
        expect(subject.can_use_services?).to be true
      end
    end

    context 'when the person is underage with parent permission' do
      let(:age) { 15 }

      it 'return true' do
        expect(subject.can_use_services?).to be true
      end
    end
    
    context 'when the person is underage without parent permission' do
      let(:age) { 15 }
      let(:parent_permission) { false }

      it 'returns false' do
        expect(subject.can_use_services?).to be false
      end
    end 
  end

  describe '#add_rental' do
    let(:book_title) { 'The Great Gatsby' }
    let(:author_name) { 'F. Scott Fitzgerald' }
    let(:book) { Book.new(book_title, author_name) }
    let(:date) { '2023-11-16' }

    it 'adds rental to the person with a book and date' do
      rental = subject.add_rental(book, date)

      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(subject)
      expect(subject.rentals).to include(rental)
    end
  end
end