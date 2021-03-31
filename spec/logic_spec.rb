require_relative '../lib/helper'

module TicTacToe
  describe GameLogic do
    let(:game_logic) { GameLogic.new }

    describe '#valid_cell?' do
      it 'Check if the cell is a valid position - Should return true' do
        expect(game_logic.valid_cell?('1')).to eql(true)
      end

      it 'Check if the cell is a valid position - Should return false' do
        expect(game_logic.valid_cell?('this a string!')).to eql(false)
      end

      it 'Check if the cell is a valid position - Should return false' do
        expect(game_logic.valid_cell?('')).to eql(false)
      end

      it 'Check if the cell is a valid position - Should return false' do
        player = double('player_1', name: 'John', letter: 'X')
        game_logic.set_position(2, player)
        expect(game_logic.valid_cell?('2')).to eql(false)
      end

      it 'Check if the cell is a valid position - Should return false' do
        expect(game_logic.valid_cell?('-3')).to eql(false)
      end

      it 'Check if the cell is a valid position - Should return false' do
        expect(game_logic.valid_cell?('12')).to eql(false)
      end
    end

    describe '#set_position' do
      it "Returns nil if there's no winner or the game is incomplete" do
        player1 = double('player_1', name: 'John', letter: 'X')
        allow(player1).to receive(:name).with('John').and_return(player1)
        allow(player1).to receive(:letter).with('X').and_return(player1)

        expect(game_logic.set_position(2, player1)).to eql(nil)
      end

      it "Returns string including 'CONGRATULATIONS!' if there's a winner" do
        player1 = double('player_1', name: 'John', letter: 'X')
        game_logic.set_position(1, player1)
        game_logic.set_position(2, player1)
        expect(game_logic.set_position(3, player1)).to include('CONGRATULATIONS!')
      end

      it "Returns string including 'TIE' if there's a draw" do
        player1 = double('player_1', name: 'John', letter: 'X')
        player2 = double('player_2', name: 'Maria', letter: 'O')
        game_logic.set_position(1, player1)
        game_logic.set_position(2, player2)
        game_logic.set_position(3, player1)
        game_logic.set_position(5, player2)
        game_logic.set_position(6, player1)
        game_logic.set_position(7, player2)
        game_logic.set_position(8, player1)
        game_logic.set_position(4, player2)
        expect(game_logic.set_position(9, player2)).to include('TIE')
      end
    end

    describe '#show_board' do
      it 'Returns the empty board for the user' do
        expect(game_logic.show_board).to eq("+---+---+---+\n| 1 | 2 | 3 |\n+---+---+---+\n| 4 | 5 | 6 |\n+---+---+---+\n| 7 | 8 | 9 |\n+---+---+---+\n\n")
      end

      it 'Returns the empty board for the user' do
        player1 = double('player_1', name: 'John', letter: 'X')
        player2 = double('player_2', name: 'Maria', letter: 'O')
        game_logic.set_position(1, player1)
        game_logic.set_position(4, player2)
        game_logic.set_position(2, player1)
        game_logic.set_position(5, player2)
        game_logic.set_position(3, player1)

        expect(game_logic.show_board).to eq("+---+---+---+\n| X | X | X |\n+---+---+---+\n| O | O | 6 |\n+---+---+---+\n| 7 | 8 | 9 |\n+---+---+---+\n\n")
      end
    end
  end
end
