require './app'
require './library_app'

app = App.new
LibraryApp.new
app.run

LibraryApp.start
