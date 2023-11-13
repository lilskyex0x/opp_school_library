require './app'
require './library_app'

app = App.new
library_app = LibraryApp.new
app.run

LibraryApp.start