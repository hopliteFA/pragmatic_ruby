require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

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
    end
end

if (__FILE__) == $0
    puts "This code ran successfully"
end
