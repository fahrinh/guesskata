require 'word_bank'

describe WordBank do
  let(:populated_list_word) {%w(food clock)}
  let(:empty_list_word) {%w()}

  let(:populated_word_bank) {
    word_bank = WordBank.new(populated_list_word)
    word_bank
  }

  let(:empty_word_bank) {
    word_bank = WordBank.new(empty_list_word)
    word_bank
  }

  describe '#remove_word' do

    context 'given a list of word' do
      it 'returns a list of word with excluded word' do
        w = 'food'
        populated_word_bank.remove_word(w)
        inst_list_word = populated_word_bank.instance_variable_get(:@list_word)

        expect(inst_list_word).to_not include(w)
      end
    end

    context 'given an empty list' do
      it 'returns an empty list' do
        w = 'food'
        empty_word_bank.remove_word(w)
        inst_list_word = empty_word_bank.instance_variable_get(:@list_word)

        expect(inst_list_word.length).to eq(0)
      end
    end
  end

  describe '#pick_word' do

    context 'given a list of word' do
      it 'returns one of word' do
        w = populated_word_bank.pick_word

        expect(populated_list_word).to include(w)
      end
    end

    context 'given an empty list' do
      it 'returns nil' do
        w = empty_word_bank.pick_word

        expect(w).to eq(nil)
      end
    end
  end

  describe '.obfuscate' do

    context 'given a word' do
      it 'returns a not same with original word' do
        ori_w = 'food'
        obs_w = WordBank.obfuscate(ori_w)

        expect(obs_w).to_not eq(ori_w)
      end
    end


  end

end