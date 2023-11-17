require 'rspec'
require './classes/book'
require './classes/person'
require 'json'
require 'date'

describe Book do
  let(:book_title) { 'The Great Gatsby' }
  let(:book_author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(book_title, book_author) }

  describe '#initialize' do
    it 'creates a new Book instance with the given title and author' do
      expect(book.title).to eq(book_title)
      expect(book.author).to eq(book_author)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new Rental and adds it to the book' do
      person = instance_double('Person')
      date = Date.new(2023, 11, 17)

      expect(Rental).to receive(:new).with(date, book, person)
      book.add_rental(person, date)
    end
  end

  it 'to_json should turn book into a json file' do
    file_path = './data/book_test.json'
    json = File.exist?(file_path) ? JSON.parse(File.read(file_path)) : {}
    File.write(file_path, JSON.pretty_generate(book))
    puts "book.title: #{book.title}"
    puts "json['title']: #{json['title']}"
    expect(book.title).to eql(json['title'])
  end
end
