$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'console_game'
require 'game_creator'
require 'game_catalogue'
require 'modes'

console = ConsoleGame.new
game_creator = GameCreator.new(console)
game_catalogue = GameCatalogue.new
game = game_creator.create
game.start
game_catalogue.add(game.recording)
id = console.ask_for_game_to_replay(game_catalogue.games)
recording = game_catalogue.select_game(id)
recording.get.start
