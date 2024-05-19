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

    context 'given n number' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.new.add('1,2,3,4')).to eq(10)
      end
    end

    context 'given n number with new lines' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.new.add("1\n2,3")).to eq(6)
      end
    end

    context 'Consecutive delimiters' do
      it 'raises an ArgumentError' do
        expect { StringCalculator.new.add("1,\n") }.to raise_error(ArgumentError, "Invalid input")
      end
    end
  end  
end
