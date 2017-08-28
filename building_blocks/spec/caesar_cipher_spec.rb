require 'caesar_cipher'

describe '#caesar' do

  let(:sentence) { 'My name is Davorin Bogovich! Everything around me is world in black and white.'}
  let(:sentence_rot) {'Vh wjvn rb Mjexarw Kxpxerlq! Nenahcqrwp jaxdwm vn rb fxaum rw kujlt jwm fqrcn.'}

  context 'given an empty string' do
    it 'returns empty string with 0 rotation' do
      expect(caesar('', 0)).to eq('')
    end

    it 'returns empty string with 6 rotations' do
      expect(caesar('', 6)).to eq('')
    end
  end

  context 'one letter' do
    context 'given downcase letter with no rotation' do
      it 'returns the same letter' do
        expect(caesar('a', 0)).to eq('a')
      end
    end

    context 'given upcase letter with no rotation' do
      it 'returns the same letter' do
        expect(caesar('A', 0)).to eq('A')
      end
    end

    context "given letter 'a' with 6 rotations" do
      it "returns letter 'g'" do
        expect(caesar('a', 6)).to eq('g')
      end
    end

    context "given letter 'a' with 36 rotations(more than 1 cycle)" do
      it "returns letter 'k'" do
        expect(caesar('a', 36)).to eq('k')
      end
    end
  end

  context 'one word' do
    context 'given a downcase word' do
      it 'returns the word rotated, downcase' do
        expect(caesar('appearance', 9)).to eq('jyynjajwln')
      end
    end

    context 'given an upcase word' do
      it 'returns the word rotated, upcase' do
        expect(caesar('RETURNS', 9)).to eq('ANCDAWB')
      end
    end

    context 'given a mixcase word' do
      it 'returns the word rotated, mixcases' do
        expect(caesar('sHoRteR', 9)).to eq('bQxAcnA')
      end
    end
  end

  context 'non-word characters' do
    context 'given a word with non-word chars' do
      it 'returns the word rotated, non-word chars intact' do
        expect(caesar('sH!oR\te?R', 9)).to eq('bQ!xA\cn?A')
      end
    end

    context 'given non-word characters only' do
      it 'returns the same characters' do
        expect(caesar('"#!?^[]"', 9)). to eq('"#!?^[]"')
      end
    end

    context 'given numbers' do
      it 'returns the same numbers, stringified' do
        expect(caesar(238_974_374, 9)). to eq('238974374')
      end
    end
  end

  context 'sentences' do
    context 'given a sentence' do
      it 'returns the sentence rotated, case and non-word chars intact' do
        expect(caesar(sentence, 9)).to eq(sentence_rot)
      end
    end
  end
end
