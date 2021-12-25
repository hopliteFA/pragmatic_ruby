module StudioGame

    require_relative 'player'

    class BerserkPlayer < Player

        def initialize(name, health=100)
            super(name, health)
            @woot_count = 0
        end 

        def berserk?
            @woot_count > 5
        end 

        def wOOt
            super
            @woot_count += 1
            if berserk?
                puts "#{name} is berserk!"
            end
        end

        def blam  
            if berserk?
                wOOt
            else
                super
            end
        end
    end 


    if __FILE__ == $0
        berserker = BerserkPlayer.new("berserker", 50)
        6.times { berserker.wOOt }
        2.times { berserker.blam }
        puts berserker.health
    end

end