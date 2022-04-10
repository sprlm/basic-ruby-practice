# frozen_string_literal: true

require_relative 'row'

# The board class contains all the previously guessed rows in a game
class Board
  def initialize
    @rows = []
  end

  def add_row(row)
    @rows.push(row)
  end

  def display
    @rows.each(&:display)
  end

  def reset
    @rows = []
  end
end
