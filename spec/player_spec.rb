require 'player'

describe Player do

  describe '#inc_score' do

    context 'given a new default Player' do
      it 'returns 1 for the first time' do
        p = Player.new('foo')
        p.inc_score

        expect(p.score).to eq(1)
      end
    end
  end

end