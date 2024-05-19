require_relative '../string_calculator'

RSpec.describe StringCalculator do
  subject { described_class.new }

  describe '#add' do
    context 'given an empty string' do
      it 'returns zero' do
        expect(StringCalculator.new.add('')).to eq(0)
      end
    end
    context 'given nil' do
      it 'returns zero' do
        expect(StringCalculator.new.add(nil)).to eq(0)
      end
    end
  end
end
