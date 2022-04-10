# frozen_string_literal: true

require_relative 'board'
require_relative 'computer'
require_relative 'player'
require_relative 'row'

# The Game class handles the logic and computations for the game
class Game
  def initialize
    @board = Board.new
    @computer = Computer.new
    @player = Player.new
    @secret_code = []
    @turn = 1
  end

  def start_game
    input = ''
    loop do
      puts 'Play as guesser (g) or creator (c)?'
      input = gets.chomp

      break if %w[g c].include?(input)

      puts "\nInvalid Input.\n\n"
    end

    input == 'g' ? play_as_guesser : play_as_creator

    play_again
  end

  private

  def play_again
    puts "Type 'y' to play again. Type anything else to quit."
    input = gets.chomp

    return unless input == 'y'

    reset_game
    start_game
  end

  def reset_game
    @board.reset
    @computer.reset
    @secret_code = []
    @turn = 1
  end

  def play_as_guesser
    @secret_code = @computer.create_code

    while @turn <= 12
      guess = @player.input_guess
      black, white = check_guess(guess)
      @board.add_row(Row.new(guess, black, white))

      puts "\nTurn #{@turn}:"
      @board.display

      break if black == 4

      @turn += 1
    end

    @turn == 13 ? (puts "\nYou lose!\n\n") : (puts "\nYou win!\n\n")
  end

  def play_as_creator
    @secret_code = @player.input_code

    while @turn <= 12
      guess = @computer.create_guess(@secret_code)
      black, white = check_guess(guess)
      @board.add_row(Row.new(guess, black, white))

      break if black == 4

      @turn += 1
    end

    @turn == 13 ? (puts "\nTurn #{@turn - 1}:") : (puts "\nTurn #{@turn}:")
    @board.display

    @turn == 13 ? (puts "\nThe computer lost!\n\n") : (puts "\nThe computer won!\n\n")
  end

  def check_guess(guess)
    black = 0
    white = 0
    taken_indexes = []

    4.times do |i|
      if guess[i] == @secret_code[i]
        black += 1
        taken_indexes.push(i)
      end
    end

    4.times do |i|
      4.times do |j|
        next unless guess[i] == @secret_code[j] && !taken_indexes.include?(j)

        white += 1
        taken_indexes.push(j)
        break
      end
    end

    [black, white]
  end
end
