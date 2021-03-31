require_relative '../lib/player'
require_relative '../lib/helper'

module TicTacToe
  game = GameLogic.new

  puts "Welcome to Ruby's Tic-Tac-Toe!"

  puts "\nEnter Player 1 name:"
  player1 = Player.new(gets.chomp.capitalize, 'X')

  puts "\nEnter Player 2 name:"
  player2 = Player.new(gets.chomp.capitalize, 'O')

  puts "\n#{player1.name} will play with X and #{player2.name} will play with O"

  puts "\nLets Start!"
  puts '[press ENTER to start]'
  gets

  player_turn = player1

  while game.game_is_on
    system('clear')
    system('cls')

    puts game.show_board

    puts "It's #{player_turn.name}'s turn!"

    puts "\nPlease select an available number from the board:"
    cell = gets.chomp

    until game.valid_cell?(cell)
      puts "\nInvalid move. please enter a number from 1-9 that has not been taken yet."
      cell = gets.chomp
    end

    game.set_position(cell.to_i, player_turn)

    player_turn = player_turn == player1 ? player2 : player1

  end

  system('clear')
  system('cls')

  puts game.show_board

  puts game.result
end
