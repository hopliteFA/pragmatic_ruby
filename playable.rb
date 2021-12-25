module StudioGame

    module Playable
        def wOOt
            @health += 15
            puts "#{@name} got wooted!"
        end

        def blam
            @health -= 10
            puts "#{@name} got blammed!"
        end

        def strong?
            @health > 100
        end
    end
end