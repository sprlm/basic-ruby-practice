class Game
  def initialize
    @grid = Grid.new
    @current_player = 'O'
  end

  def play_game
    loop do
      play_turn

      if @grid.check_winner == 'none'
        change_current_player
      else
        @grid.display
        puts "\n#{@current_player} wins! Type 'exit' to quit. Type anything else to play again!"
        input = gets.chomp
        reset_game
      end

      break if input == 'exit'
    end
  end

  private

  def change_current_player
    @current_player = (@current_player == 'O' ? 'X' : 'O')
  end

  def play_turn
    loop do
      @grid.display

      puts "\nCurrent player: #{@current_player}"
      puts 'Input row (1-3): '
      row = gets.chomp.to_i
      puts 'Input column (1-3): '
      column = gets.chomp.to_i

      break unless @grid.place(@current_player, row, column).nil?

      puts "\nThat square is already taken!\n\n"
    end
  end

  def reset_game
    @grid.clear
    @current_player = 'O'
  end
end

class Grid
  def initialize
    @grid = Array.new(3) { Array.new(3) { Square.new } }
  end

  def place(content, row, column)
    row -= 1
    column -= 1
    @grid[row][column].content = content if @grid[row][column].content == ' '
  end

  def display
    puts " #{@grid[0][0].content} | #{@grid[0][1].content} | #{@grid[0][2].content} "
    puts '---+---+---'
    puts " #{@grid[1][0].content} | #{@grid[1][1].content} | #{@grid[1][2].content} "
    puts '---+---+---'
    puts " #{@grid[2][0].content} | #{@grid[2][1].content} | #{@grid[2][2].content} "
  end

  def clear
    (0..2).each do |row|
      (0..2).each do |column|
        @grid[row][column].clear
      end
    end
  end

  def check_winner
    (1..8).each do |i|
      case i
      when 1
        line = @grid[0][0].content + @grid[0][1].content + @grid[0][2].content
      when 2
        line = @grid[1][0].content + @grid[1][1].content + @grid[1][2].content
      when 3
        line = @grid[2][0].content + @grid[2][1].content + @grid[2][2].content
      when 4
        line = @grid[0][0].content + @grid[1][0].content + @grid[2][0].content
      when 5
        line = @grid[0][1].content + @grid[1][1].content + @grid[2][1].content
      when 6
        line = @grid[0][2].content + @grid[1][2].content + @grid[2][2].content
      when 7
        line = @grid[0][0].content + @grid[1][1].content + @grid[2][2].content
      when 8
        line = @grid[0][2].content + @grid[1][1].content + @grid[2][0].content
      end

      return 'X' if line == 'XXX'
      return 'O' if line == 'OOO'
    end

    'none'
  end
end

class Square
  attr_accessor :content

  def initialize
    @content = ' '
  end

  def clear
    @content = ' '
  end
end

game = Game.new
game.play_game
