require_relative '../lib/player'

module TicTacToe
  describe Player do
    describe '#initialize' do
      it 'player is an instance of Player' do
        expect(Player.new('John', 'X')).to be_an_instance_of(Player)
      end

      it 'player is an object' do
        expect(Player.new('John', 'X')).to be_a(Object)
      end
    end
  end
end
