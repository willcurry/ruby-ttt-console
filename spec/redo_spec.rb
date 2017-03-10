require 'redo'
require 'undo'
require 'game'
require 'human_player'
require 'console_game'

RSpec.describe Redo do
  before (:each) do
    @game = Game.new(Board.new, HumanPlayer.new('x'), HumanPlayer.new('o'), ConsoleGame.new)
    @command_manager = CommandManager.new(@game)
  end
  
  it "can redo a round" do
    @command_manager.manage('1')
    old = @game.board
    @command_manager.manage('undo')
    expect(@game.board).not_to eq(old)
    @command_manager.manage('redo')
    expect(@game.board).to eq(old)
  end
end
