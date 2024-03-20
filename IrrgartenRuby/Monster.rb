module Irrgarten
  class Monster
    @@INITIAL_HEALTH = 5
   

    def initialize(name,strength, health)
      @name = name
      @strength = strength
      @health = health
      @row = 0
      @col = 0
    end

    def setPos(row, col)
      @row = row
      @col = col
    end

    def dead
      dead = false
      if(@health <= 0)then 
        dead = true
      end
      return dead
    end
    
    def attack
      return Dice.intensity(@strength)
    end

    def to_s
      "#{@name}[#{@strength}, #{@health}]"
    end
     
    def gotWounded
      @health -= 1
    end
  end
  
end
