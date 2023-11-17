require_relative 'spec_helper'

RSpec.describe CapitalizeDecorator do
  let(:nameable_double) { double('Nameable', correct_name: 'lilsnow') }
  let(:capitalize_decorator) { described_class.new(nameable_double) }

  describe '#correct_name' do
    it 'capitalizes the correct_name of the underlying nameable object' do
      expect(capitalize_decorator.correct_name).to eq('Lilsnow')
    end
  end
end
