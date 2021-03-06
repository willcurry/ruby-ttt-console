require 'undo'
require 'game'
require 'human_player'
require 'console_game'

RSpec.describe Undo do
  before (:each) do
    @game = Game.new(Board.new, HumanPlayer.new('x'), HumanPlayer.new('o'), ConsoleGame.new)
    @command_manager = CommandManager.new(@game)
  end
  
  it "can undo a round" do
    @command_manager.manage('1')
    old = @game.board.cells
    @command_manager.manage('undo')
    expect(@game.board.cells).not_to eq(old)
  end
end
