require './classroom'
require './student'

RSpec.describe Classroom do
    let(:classroom_label) { 'Computer Science A' }
    let(:classroom) { Classroom.new(classroom_label) }
  
    describe '#initialize' do
      it 'creates a new Classroom instance with the given label' do
        expect(classroom.label).to eq(classroom_label)
        expect(classroom.students).to be_empty
      end
    end
  
    describe '#add_student' do
      it 'adds a student to the classroom and sets the classroom for the student' do
        student = double('Student')
        expect(student).to receive(:classroom=).with(classroom)
        classroom.add_student(student)
        expect(classroom.students).to include(student)
      end
    end
  end