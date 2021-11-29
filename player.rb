class Player
    attr_reader :health, :name
    attr_writer :name
 
    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end

    def wOOt
        @health += 15
        puts "#{@name} got wooted!"
    end

    def blam
        @health -= 10
        puts "#{@name} got blammed!"
    end

    def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score}."
    end

    def score
        score = @health + @name.length
    end

    def strong?
        @health > 100
    end

    def <=> (other)
        other.score <=> score
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
