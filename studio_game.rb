require_relative 'player'
require_relative 'game'

player1 = Player.new('moe', 100)
player2 = Player.new('Larry', 60)
player3 = Player.new('Curly', 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(3)
knuckleheads.print_stats