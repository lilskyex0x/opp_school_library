require 'rspec'
require 'json'
require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  context 'Given a Student named Lilsnow' do
    before :each do
      @classroom = Classroom.new('Geography')
      @student = Student.new(age: 24, name: 'Lilsnow', parent_permission: false, classroom: @classroom)
    end
    it '@student be an instance of Student' do
      expect(@student).to be_an_instance_of(Student)
    end

    it 'add_classroom should asign a clasroom to the student' do
      @student.add_classroom(@classroom)
      expect(@classroom.students).to include(@student)
    end

    it 'can_use_services should return true, as student is over 18' do
      expect(@student.can_use_services?).to be_truthy
    end

    it 'plays hooky' do
      expect(@student.play_hooky).to eq('¯\(ツ)/¯')
    end

    it 'to_json should return a valid JSON representation of the student' do
      json_data = JSON.parse(@student.to_json)

      expect(json_data['id']).to be_instance_of(Integer)
      expect(json_data['age']).to eq(24)
      expect(json_data['name']).to eq('Lilsnow')
      expect(json_data['parent_permission']).to be_falsy
      expect(json_data['classroom']).to eq('Geography') # Adjust based on your implementation
    end
  end
end
