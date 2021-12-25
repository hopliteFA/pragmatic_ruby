module StudioGame

    require_relative 'die'
    require_relative 'player'
    require_relative 'game_turn'
    require_relative 'treasure_trove'
    require_relative 'loaded_die'

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
            
            random_treasure = TreasureTrove.random

            player.found_treasure(random_treasure)

        end
        
    end
end