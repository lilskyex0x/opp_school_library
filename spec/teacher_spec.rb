require './classes/teacher'

RSpec.describe Teacher do
  let(:specialization) { 'Mathematics' }
  let(:age) { 35 }
  let(:name) { 'Ms. Johnson' }
  let(:parent_permission) { true }
  subject do
    described_class.new(specialization: specialization, age: age, name: name, parent_permission: parent_permission)
  end

  describe '#initialize' do
    it 'creates an instance of Teacher with the given specialization, age, name, and parent permission' do
      expect(subject.specialization).to eq(specialization)
      expect(subject.age).to eq(age)
      expect(subject.name).to eq(name)
      expect(subject.parent_permission).to eq(parent_permission)
      expect(subject.rentals).to be_empty
      expect(subject.id).to be_a(Integer)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for teachers' do
      expect(subject.can_use_services?).to be true
    end
  end
end
