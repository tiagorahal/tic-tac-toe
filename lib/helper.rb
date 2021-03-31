module TicTacToe
  class GameLogic
    attr_reader :result, :game_is_on, :board

    def initialize
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      @game_is_on = true
      @winner_letter = ''
      @result = ''
    end

    def valid_cell?(cell)
      cell !~ /\D/ && !cell.empty? && @board[cell.to_i - 1] !~ /\D/ && cell.to_i.positive? && cell.to_i < 10
    end

    def set_position(cell, player)
      @board[cell - 1] = player.letter
      check(player)
    end

    def show_board
      "+---+---+---+\n| #{@board[0]} | #{@board[1]} | #{@board[2]} |\n+---+---+---+\n| #{@board[3]} | #{@board[4]} | #{@board[5]} |\n+---+---+---+\n| #{@board[6]} | #{@board[7]} | #{@board[8]} |\n+---+---+---+\n\n"
    end

    private

    def win(player_name)
      @result = "\nCONGRATULATIONS!\n\n#{player_name}, you WIN the game!"
    end

    def tie
      @result = "\nIt's a TIE!\n\nGame is Over! That was a great game!"
    end

    def line_check(cell1, cell2, cell3)
      @winner_letter = @board[cell1] == @board[cell2] && @board[cell1] == @board[cell3] ? @board[cell1] : @winner_letter
    end

    def check(player)
      line_check(0, 1, 2)
      line_check(3, 4, 5)
      line_check(6, 7, 8)
      line_check(0, 3, 6)
      line_check(1, 4, 7)
      line_check(2, 5, 8)
      line_check(0, 4, 8)
      line_check(2, 4, 6)

      if @winner_letter.length == 1
        @game_is_on = false
        win(player.name)

      elsif @board.none?(Numeric)
        @game_is_on = false
        tie
      end
    end
  end
end
