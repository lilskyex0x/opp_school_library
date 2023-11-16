require './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*_args)
    {
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals.map(&:to_json)
    }.to_json
  end
end
