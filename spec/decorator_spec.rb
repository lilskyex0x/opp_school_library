require './classes/decorator'

RSpec.describe Decorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'Original Name') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'delegates to the correct_name method of the underlying nameable object' do
      expect(subject.correct_name).to eq('Original Name')
    end
  end
end
