require 'rspec'
require 'json'
require './classes/book'
require './classes/teacher'
require './classes/rental'

describe Book do
  context 'Given a Book named The Sphere by Michael Crichton' do
    before :each do
      @person = Teacher.new(specialization: 'Mathematics', age: 52, name: 'Lilsnow', parent_permission: true)
      @book = Book.new('Sphere', 'Michael Crichton')
    end

    it 'to_json should return a valid JSON representation of the rental' do
      rental = Rental.new('2020-10-23', @book, @person)
      json_data = JSON.parse(rental.to_json)

      expect(json_data['date']).to eq('2020-10-23')
      expect(json_data['book']['title']).to eq('Sphere')
      expect(json_data['book']['author']).to eq('Michael Crichton')
      expect(json_data['person']['age']).to eq(52)
      expect(json_data['person']['name']).to eq('Lilsnow')
    end
  end
end
