require 'json'

class Manager
  def initialize(filename)
    @filename = filename
  end

  def load_data
    if File.exist?(@filename)
      file = File.read(@filename)
      JSON.parse(file)
    else
      puts "The file '#{@filename}' does not exist. Creating..."
      File.write(@filename, '[]')
      []
    end
  end

  def save_data(data)
    File.write(@filename, JSON.pretty_generate(data))
  end
end
