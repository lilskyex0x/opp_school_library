require 'rspec'
require './classes/nameable'

describe Nameable do
  let(:nameable_instance) { Nameable.new }

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable_instance.correct_name }.to raise_error(NotImplementedError, /#{__method__}/)
    end
  end
end
