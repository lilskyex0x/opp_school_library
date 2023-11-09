require './book'

class App
  attr_accessor :books

  def initialize
    @books = []
  end

  def book_list
    if @books.empty?
      puts 'There is no book in the list'
    else
      @book.each_with_index do |book, index|
        puts "#{index} - Title: #{book.title.capitalize}, Author: #{book.author.capitalize}"
      end
    end
  end
end
