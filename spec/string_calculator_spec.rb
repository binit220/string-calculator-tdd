require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for empty string' do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number for single number string' do
      calculator = StringCalculator.new
      expect(calculator.add("1")).to eq(1)
      expect(calculator.add("5")).to eq(5)
    end

    it 'returns sum of two comma-separated numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1,5")).to eq(6)
      expect(calculator.add("2,3")).to eq(5)
    end

    it 'returns sum of multiple numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1,2,3")).to eq(6)
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'handles newlines between numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
      expect(calculator.add("1,2\n3")).to eq(6)
    end

    it 'supports different delimiters' do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
      expect(calculator.add("//|\n1|2|3")).to eq(6)
    end

    it 'throws exception for negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add("-1,2") }.to raise_error("negative numbers not allowed -1")
      expect { calculator.add("2,-4,3,-5") }.to raise_error("negative numbers not allowed -4,-5")
    end
  end
end