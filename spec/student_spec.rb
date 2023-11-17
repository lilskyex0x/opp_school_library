require 'rspec'
require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  context 'Given a Student named Santiago' do
    before :each do
      @classroom = Classroom.new('Gepgraphy')
      @student = Student.new(age: 24, name: 'Santiago', parent_permission: false, classroom: @classroom)
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
  end
end
