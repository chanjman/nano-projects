# spec/string_calculator_spec.rb
require 'string_calculator'

describe StringCalculator do
  describe '.add' do
    context 'given an empty string' do
      it 'returns zero' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'single numbers' do
      context 'given 4' do
        it 'returns 4' do
          expect(StringCalculator.add('4')).to eq(4)
        end
      end

      context 'given 44' do
        it 'returns 44' do
          expect(StringCalculator.add('44')).to eq(44)
        end
      end
    end

    context 'two numbers' do
      context 'given 2, 4' do
        it 'returns 6' do
          expect(StringCalculator.add('2, 4')).to eq(6)
        end
      end

      context 'given 183, 339' do
        it 'returns 522' do
          expect(StringCalculator.add('183, 339')).to eq(522)
        end
      end
    end
  end
end
