require_relative '../string_calculator'

RSpec.describe StringCalculator do
  subject { described_class.new }

  describe '#add' do
    context 'given an empty string' do
      it 'returns zero' do
        expect(subject.add('')).to eq(0)
      end
    end

    context 'given nil' do
      it 'returns zero' do
        expect(subject.add(nil)).to eq(0)
      end
    end

    context 'given a string with valid numbers and default delimiters' do
      it 'returns the sum of the numbers' do
        expect(subject.add('1,2,3')).to eq(6)
        expect(subject.add("1\n2,3")).to eq(6)
      end
    end

    context 'given a string with custom delimiter' do
      it 'returns the sum of the numbers' do
        expect(subject.add("//;\n1;2")).to eq(3)
        expect(subject.add("//|\n1|2|3")).to eq(6)
        expect(subject.add("//***\n1***2***3")).to eq(6)
      end
    end

    context 'given a string with consecutive default delimiters' do
      it 'raises an ArgumentError' do
        expect { subject.add("1,\n") }.to raise_error(ArgumentError, "Invalid input")
        expect { subject.add("1,\n2") }.to raise_error(ArgumentError, "Invalid input")
        expect { subject.add('1,,2') }.to raise_error(ArgumentError, "Invalid input")
        expect { subject.add("1\n\n2") }.to raise_error(ArgumentError, "Invalid input")
      end
    end

    context 'given a string with consecutive custom delimiters' do
      it 'raises an ArgumentError' do
        expect { subject.add("//;\n1;;2") }.to raise_error(ArgumentError, "Invalid input")
        expect { subject.add("//|\n1||2") }.to raise_error(ArgumentError, "Invalid input")
      end
    end

    context 'given a string with negative numbers' do
      it 'raises an ArgumentError with the negative numbers listed' do
        expect { subject.add('1,-2,3') }.to raise_error(ArgumentError, "Negative numbers not allowed: -2")
        expect { subject.add("//;\n1;-2;-3") }.to raise_error(ArgumentError, "Negative numbers not allowed: -2, -3")
      end
    end
  end
end
