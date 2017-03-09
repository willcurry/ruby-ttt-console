require 'game'
require 'board'
require 'console_game'

RSpec.describe CommandManager do
  before (:each) do
    @input = StringIO.new
    game = Game.new(Board.new, HumanPlayer.new('x', @input), HumanPlayer.new('o', @input), ConsoleGame.new)
    @command_manager = CommandManager.new(game)
  end

  it "should be able to tell if the given input is a move" do
    expect(@command_manager.is_move?("1")).to eq(true)
  end

  it "should be able to tell if the given input is an undo command" do
    expect(@command_manager.is_undo_command?("undo")).to eq(true)
  end

  it "should be able to tell if the given input is an redo command" do
    expect(@command_manager.is_redo_command?("redo")).to eq(true)
  end
end
