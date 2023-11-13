require './app'
require './library_app'

LibraryApp.start

app = App.new

def process_options(app, option)
  case option
  when '1' then app.book_list
  when '2' then app.people_list
  when '3' then app.person_create
  when '4' then app.new_book
  when '5' then app.new_rental
  when '6' then app.rental_list
  else
    puts 'This is not a valid option'
  end
end

loop do
  app.display_menu
  option = gets.chomp

  break if option == '7'

  process_options(app, option)
end

puts 'Thank you for using this app!'
