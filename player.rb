module StudioGame

    require_relative 'treasure_trove'
    require_relative 'playable'

    class Player

        include Playable

        attr_reader :health, :name
        attr_writer :name
    
        def initialize(name, health=100)
            @name = name.capitalize
            @health = health
            @found_treasures = Hash.new(0)
        end

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

        def to_s
            "I'm #{@name} with a health of #{@health}, points = #{points}, and a score of #{score}."
        end

        def score
            score = @health + points
        end

        def <=> (other)
            other.score <=> score
        end

        def found_treasure(treasure)
            @found_treasures[treasure.name] += treasure.points
            puts "#{@name} found a #{treasure.name} worth #{treasure.points}."
            puts "#{@anme} found treasures are #{@found_treasures}.\n"
        end

        def points
            @found_treasures.values.reduce(0, :+)
        end

        def each_found_treasure
            @found_treasures.each do |k,v|
                yield Treasure.new(k,v)
            end
        end

        def self.from_csv(string)
            name, health = string.split(',')
            Player.new(name, Integer(health))
        end

    end

    #this prevents the example code from running unless the 
    #currently running file ($0) matches the current
    #source file (__FILE__)
    if __FILE__ == $0
        player = Player.new("moe")
        puts player.name
        puts player.health
        player.wOOt
        puts player.health
        player.blam
        puts player.health
    end
end