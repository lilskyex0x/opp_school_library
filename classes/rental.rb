require './classes/book'
require './classes/person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_json(*_args)
    {
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json
  end
end
