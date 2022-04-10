# frozen_string_literal: true

# The Computer class can automatically guess or create a secret code
class Computer
  def initialize
    @guess = %w[0 0 0 0]
  end

  def create_code
    code = []

    4.times do
      code.push(rand(1..6).to_s)
    end

    code
  end

  def create_guess(secret_code)
    4.times do |i|
      @guess[i] = rand(1..6).to_s if @guess[i] != secret_code[i]
    end

    @guess.dup
  end

  def reset
    @guess = %w[0 0 0 0]
  end
end
