require 'rspec'
require './classes/book'
require './classes/rental'

describe Book do
  context 'Given a Book named The Sphere by Michael Crichton' do
    before :each do
      @person = Person.new(age: 24, name: 'Santiago')
      @book = Book.new('Sphere', 'Michael Crichton')
    end

    it '@rental should be instance of Rental' do
      rental = Rental.new('2020-10-23', @book, @person)
      expect(rental).to be_an_instance_of(Rental)
    end
  end
end
