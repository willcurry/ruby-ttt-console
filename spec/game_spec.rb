require 'game'
require 'console_game'

RSpec.describe Game do
  let (:board) {Board.new}

  before(:each) do
    @input = StringIO.new
    @player_one = HumanPlayer.new('x', @input)
    @player_two = HumanPlayer.new('o', @input)
    @game = Game.new(board, @player_one, @player_two, ConsoleGame.new)
  end

  it "knows whos turn it is" do
    @game.make_move(0)
    @game.make_move(0)
    expect(@game.board.cells[0]).to eq('x')
  end
end
