require './book'
require './student'
require './teacher'
require './preserve_data'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = read_file('./data/books.json')
    @people = read_file('./data/people.json')
    @rentals = read_file('./data/rentals.json')
  end

  def book_list
    @books = read_file('./data/books.json')
    if @books.empty?
      puts 'There is no book in the list'
    else
      @books.each_with_index do |book, index|
        rentals_str = book['rentals'].join(', ') # Convert array to string
        puts "#{index} - Title: #{book['title'].capitalize}, " \
             "Author: #{book['author'].capitalize} Rentals: #{rentals_str}"
      end
    end
  end

  def people_list
    @people = read_file('./data/people.json')
    if @people.empty?
      puts 'There is no people in the list'
    else
      @people.each_with_index do |person, index|
        if person['_class'] == 'Teacher'
          puts "#{index} [Teacher] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
        elsif person['_class'] == 'Student'
          puts "#{index} [Student] Name: #{person['name']} ID: #{person['id']}, Age: #{person['age']}"
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
    write_file(@people, './data/people.json')
    puts 'Person created successfully!'
  end

  def student_create
    age = get_user_input('Age:')
    name = get_user_input('Name:')
    permission = get_user_input('Has parent permission? [y/n]').downcase
    parent_permission = permission == 'y'
    classroom = get_user_input('Classroom:')
    @people.push Student.new(age: age, name: name, parent_permission: parent_permission, classroom: classroom)
    write_file(@people, './data/people.json')
    puts 'Person created successfully!'
  end

  def new_book
    title = get_user_input('Title:')
    author = get_user_input('Author:')
    book = Book.new(title, author)
    @books.push(book)
    write_file(@books, './data/books.json')
    puts 'Book created successfully!'
  end

  def new_rental
    puts 'Select a book from the following list by number:'
    book_list
    @books = read_file('./data/books.json')
    book_index = get_user_input('').to_i
    rented_book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    people_list
    @people = read_file('./data/people.json')
    person_index = get_user_input('').to_i
    renter = @people[person_index]
    puts 'Date (YYYY-MM-DD):'
    date = get_user_input('')
    if renter['parent_permission'] == true
      @rentals.push Rental.new(date, rented_book, renter)
      write_file(@rentals, './data/rentals.json')
      puts 'Rental created successfully'
    else
      puts 'Person lacks borrow permissions'
    end
  end

  def rental_list
    @rentals = read_file('./data/rentals.json')
    renter_id = get_user_input('ID of person:')
    renter = @people.find { |person| person['id'] == renter_id.to_i }
    if renter.nil?
      puts 'No rentals found'
    else
      @rentals.each_with_index do |rental, index|
        if rental['person']['id'] == renter_id.to_i
          puts "#{index} Date: #{rental['date']}, Book: \"#{rental['book']['title']}\" by #{rental['book']['author']}"
        end
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
