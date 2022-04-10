# frozen_string_literal: true

# The Player class manages guessing and creating codes based on user input
class Player
  def input_guess
    loop do
      puts "\n(Possible values are numbers 1-6. Example input would be \"1234\")"
      puts 'Input your guess:'

      guess = gets.chomp

      return guess.split('') if valid_code?(guess)

      puts "\nInvalid input.\n\n"
    end
  end

  def input_code
    loop do
      puts "\n(Possible values are numbers 1-6. Example input would be \"1234\")"
      puts 'Input your secret code for the computer to guess:'

      code = gets.chomp

      return code.split('') if valid_code?(code)

      puts "\nInvalid input.\n\n"
    end
  end

  private

  def valid_code?(code)
    code =~ /\A[123456]+\z/ && code.length == 4
  end
end
