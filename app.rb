require './book'
require './student'
require './teacher'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    loop do
      display_menu
      option = gets.chomp

      break if option == '7'

      process_options(option)
    end

    puts 'Thank you for using this app!'
  end

  def process_options(option)
    case option
    when '1' then book_list
    when '2' then people_list
    when '3' then person_create
    when '4' then new_book
    when '5' then new_rental
    when '6' then rental_list
    else
      puts 'This is not a valid option'
    end
  end

  def book_list
    if @books.empty?
      puts 'There is no book in the list'
    else
      @books.each_with_index do |book, index|
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

  def person_create
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    number = gets.chomp
    case number
    when '1'
      student_create
    when '2'
      teacher_create
    else
      puts 'Invalid entry'
    end
  end

  def teacher_create
    age = get_user_input('Age:')
    name = get_user_input('Name:')
    specialization = get_user_input('Specialization:')
    parent_permission = true
    @people.push Teacher.new(age: age, name: name, specialization: specialization, parent_permission: parent_permission)
    puts 'Person created successfully!'
  end

  def student_create
    age = get_user_input('Age:')
    name = get_user_input('Name:')
    permission = get_user_input('Has parent permission? [y/n]').downcase
    parent_permission = permission == 'y'
    classroom = get_user_input('Classroom:')
    @people.push Student.new(age: age, name: name, parent_permission: parent_permission, classroom: classroom)
    puts 'Person created successfully!'
  end

  def new_book
    title = get_user_input('Title:')
    author = get_user_input('Author:')
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
  end

  def new_rental
    puts 'Select a book from the following list by number:'
    book_list
    book_index = get_user_input('').to_i
    rented_book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    people_list
    person_index = get_user_input('').to_i
    renter = @people[person_index]
    puts 'Date (YYYY-MM-DD):'
    date = get_user_input('')
    if renter.can_use_services?
      @rentals.push Rental.new(date, rented_book, renter)
      puts 'Rental created successfully'
    else
      puts 'Person lacks borrow permissions'
    end
  end

  def rental_list
    renter_id = get_user_input('ID of person:')
    renter = @people.find { |person| person.id == renter_id.to_i }
    if renter.nil?
      puts 'No rentals found'
    else
      renter.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}"
      end
    end
  end

  def display_menu
    puts ''
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts ''
    print 'Enter number: '
  end

  def get_user_input(prompt)
    puts prompt
    gets.chomp
  end
end
