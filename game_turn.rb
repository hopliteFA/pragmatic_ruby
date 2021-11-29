require_relative 'die'
require_relative 'player'

module  GameTurn

    def self.take_turn(player)
            
        die = Die.new
        number_rolled = die.roll

        case number_rolled
        when 5..6             
            player.wOOt
        when 1..2          
            player.blam
        else 
            puts "#{player.name} was skipped"
        end
        
        
    end
    
end