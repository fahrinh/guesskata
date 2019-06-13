require 'word_bank'

describe WordBank do
  let(:populated_list_word) {%w(food clock)}
  let(:empty_list_word) {%w()}

  let(:populated_word_bank) {
    word_bank = WordBank.new
    word_bank.instance_variable_set(:@list_word, populated_list_word)
    word_bank
  }

  let(:empty_word_bank) {
    word_bank = WordBank.new
    word_bank.instance_variable_set(:@list_word, empty_list_word)
    word_bank
  }

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

end