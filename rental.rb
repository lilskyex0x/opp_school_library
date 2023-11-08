require './book'

class Rental
  attr_accessor :date, :book

  def initialize(date, book)
    @date = date
    @book = book
    book.rentals
  end
end
