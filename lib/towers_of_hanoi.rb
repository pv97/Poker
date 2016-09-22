class Game
  attr_accessor :board

  def initialize
    @board = [[1,2,3],[],[]]
  end

  def move(pos)
    i,j = pos
    if improper_move?(pos)
      return "Can't move that way"
    else
      piece = @board[i].shift
      @board[j].unshift(piece)
    end
    @board
  end

  def improper_move?(pos)
    i,j = pos
    return false if @board[j][0].nil?
    return true if @board[i][0].nil?
    @board[i][0] > @board[j][0]
  end

  def win?
    @board[0].empty? && (@board[1].empty? || @board[2].empty?)
  end

  def play
    until win?
      p @board
      puts "Choose a piece to move"
      start_pos = gets.chomp.to_i
      puts "Choose where to move to"
      end_pos = gets.chomp.to_i
      move([start_pos,end_pos])
    end
    puts "You win!"
  end
end

# Game.new.play
