# frozen_string_literal: true

# The Row class contains a guess and the number of black and white pegs
class Row
  def initialize(guess, black, white)
    @guess = guess
    @black = black
    @white = white
  end

  def display
    puts "#{@guess.join} | #{@black} black peg(s) and #{@white} white peg(s)"
  end
end
