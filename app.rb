require './book'
require './student'
require './teacher'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
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

  def people_list
    if people.empty?
      puts 'There is no people in the list'
    else
      @people.each_with_index do |person, index|
        if person.instance_of?(Teacher)
          puts "#{index} [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.instance_of?(Student)
          puts "#{index} [Student] Name: #{person.name} ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end
end
