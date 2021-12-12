require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
    
    attr_reader :title
    
    def initialize(title)
        @title = title
        @players = []
    end

    def add_player(player)
        @players << player
    end

    def play(rounds)
        puts "There are #{@players.length} players in #{@title}:"
        puts @players 
        puts "\n"

        treasures = TreasureTrove::TREASURES
        puts "There are #{treasures.size} treasures in the game"
        treasures.each do |treasure| 
            puts "A #{treasure.name} is worth #{treasure.points} points"
        end

       1.upto(rounds) do |round|
        puts "\nRound #{round}:" 
            @players.each do |player|
                GameTurn.take_turn(player)
                puts player    
            end  
        end  
    end

    def print_stats
        
        strong_players, wimpy_players = @players.partition { |player| player.strong?}

        puts "\n#{@title} Statistics: \n"
        puts "#{strong_players.size} strong players: "
        strong_players.each { |player| puts "#{player.name} (#{player.health})\n"}

        puts "\n#{wimpy_players.size} Wimpy players: "
        wimpy_players.each { |player| puts "#{player.name} (#{player.health})\n"}

        sorted_players = @players.sort { |a, b| b.score <=> a.score}
        
        puts "\n#{title} High Score:\n"
        
        sorted_players.each do |player|  
            puts "#{player.name.ljust(15, '.')} #{player.score} "
        
        end

        @players.each do |player|
            puts "\n#{player.name}'s point totals:"
            puts "#{player.points} grand total points"
        end

        @players.sort.each do |player|
            player.each_found_treasure do |treasure|
                puts "#{treasure.points} total #{treasure.name} points."
            end
            puts "#{player.name}'s point totals"

        end
    end
end

if (__FILE__) == $0
    puts "This code ran successfully"
end
