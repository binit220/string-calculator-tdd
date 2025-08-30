require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }
  
  describe '#add' do
    context 'with empty string' do
      it 'returns 0' do
        expect(calculator.add("")).to eq(0)
      end
    end
    
    context 'with single number' do
      it 'returns the number itself' do
        expect(calculator.add("1")).to eq(1)
        expect(calculator.add("5")).to eq(5)
      end
    end
    
    context 'with two numbers' do
      it 'returns their sum' do
        expect(calculator.add("1,5")).to eq(6)
        expect(calculator.add("2,3")).to eq(5)
      end
    end
    
    context 'with multiple numbers' do
      it 'returns sum of all numbers' do
        expect(calculator.add("1,2,3")).to eq(6)
        expect(calculator.add("1,2,3,4,5")).to eq(15)
      end
    end
    
    context 'with newline delimiters' do
      it 'handles newlines between numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
        expect(calculator.add("1,2\n3")).to eq(6)
      end
    end
    
    context 'with different delimiters' do
      it 'uses the specified delimiter' do
        expect(calculator.add("//;\n1;2")).to eq(3)
        expect(calculator.add("//|\n1|2|3")).to eq(6)
      end
    end
    
    context 'with negative numbers' do
      it 'throws an exception with single negative' do
        expect { calculator.add("-1,2") }.to raise_error("negative numbers not allowed -1")
      end
      
      it 'throws an exception listing all negatives' do
        expect { calculator.add("2,-4,3,-5") }.to raise_error("negative numbers not allowed -4,-5")
      end
    end
  end
end