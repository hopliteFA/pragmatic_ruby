module StudioGame

    require_relative 'player'
    require_relative 'game'
    require_relative 'clumsy_player'
    require_relative 'berserk_player'

    knuckleheads = Game.new("Knuckleheads")
    knuckleheads.load_players(ARGV.shift || 'players.csv')

    klutz = ClumsyPlayer.new("klutz", 105)
    knuckleheads.add_player(klutz)

    berserker = BerserkPlayer.new("berserker", 50)
    knuckleheads.add_player(berserker)

    loop do
        puts "How many game rounds? ('quit' to exit)"
        answer = gets.chomp.downcase
        puts "it works"
        case answer
        when /^\d+$/
            knuckleheads.play(answer.to_i)
        when 'quit', 'exit'
            knuckleheads.print_stats
            break
        else
            puts "Please enter a number or 'quit'"
        end 
    end

    knuckleheads.save_game

    #player1 = Player.new('moe', 100)
    #player2 = Player.new('Larry', 60)
    #player3 = Player.new('Curly', 125)


    #knuckleheads.add_player(player1)
    ##knuckleheads.add_player(player2)
    #knuckleheads.add_player(player3)
    #knuckleheads.play(3)
    #knuckleheads.print_stats
end