require 'game'

class Main
  def run
    game = Game.new(STDIN, STDOUT)
    game.play
  end
end