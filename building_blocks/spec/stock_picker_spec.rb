require 'stock_picker'

describe '#stock_picker' do
  context 'given only one stock price' do
    it "returns 'You need more than one stock price!'" do
      expect(stock_picker([122])).to eq('You need more than one stock price!')
    end
  end

  context 'two stock prices' do
    context 'given prices [3, 7]' do
      it 'returns [3, 7]' do
        expect(stock_picker([3, 7])).to eq([3, 7])
      end
    end

    context 'given prices [7, 3]' do
      it "returns 'You cannot make profit in bearish market.'" do
        expect(stock_picker([7, 3])).to eq('You cannot make profit in bearish market.')
      end
    end
  end

  context 'more than two stock prices' do
    context 'given [22, 7, 8, 14, 19, 4, 3]' do
      it 'returns [7, 19]' do
        expect(stock_picker([22, 7, 8, 14, 19, 4, 3])).to eq([7, 19])
      end
    end

    context 'given descending prices [19, 17, 14, 9, 6, 3]' do
      it "returns 'You cannot make profit in bearish market.'" do
        expect(stock_picker([19, 17, 14, 9, 6, 3])).to eq('You cannot make profit in bearish market.')
      end
    end
  end
end
