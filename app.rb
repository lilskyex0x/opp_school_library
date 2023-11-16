require './book'
require './student'
require './teacher'
require './manager'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = Manager.new('./data/people.json').load_data
    @books = Manager.new('./data/books.json').load_data
    @rentals = Manager.new('./data/rentals.json').load_data
  end

  def save_json
    people_json = Manager.new('./data/people.json')
    people_json.save_data(@people)

    rentals_json = Manager.new('./data/rentals.json')
    rentals_json.save_data(@rentals)

    books_json = Manager.new('./data/books.json')
    books_json.save_data(@books)
  end

  def book_list
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
    if @people.empty?
      puts 'There is no people in the list'
    else
      @people.each_with_index do |person, index|
        if person.key?('specialization')
          puts "#{index} [Teacher] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
        else
          puts "#{index} [Student] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
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
    @people << Teacher.new(age: age, name: name, specialization: specialization, parent_permission: parent_permission)
    puts 'Person created successfully!'
  end

  def student_create
    age = get_user_input('Age:')
    name = get_user_input('Name:')
    permission = get_user_input('Has parent permission? [y/n]').downcase
    parent_permission = permission == 'y'
    classroom = get_user_input('Classroom:')
    @people << Student.new(age: age, name: name, parent_permission: parent_permission, classroom: classroom)
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
    if renter['parent_permission'] == true
      @rentals.push Rental.new(date, rented_book, renter)
      puts 'Rental created successfully'
    else
      puts 'Person lacks borrow permissions'
    end
  end

  def rental_list
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

  def close
    save_json
  end
end
