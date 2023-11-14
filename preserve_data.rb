require 'json'

def write_file(obj, filename)
  data = obj.map(&:to_h)
  data_json = JSON.generate(data)
  File.write(filename, data_json, mode: 'w')
end

def read_file(filename)
  if File.exist?(filename) and File.size(filename) != 0
    data = File.read(filename)
    JSON.parse(data)
  else
    []
  end
end
