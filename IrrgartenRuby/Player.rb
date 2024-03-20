module Irrgarten
  class Player
    @@MAX_WEAPONS = 2
    @@MAX_SHIELDS = 3
    @@INITIAL_HEALTH = 10
    @@HITS2LOSE = 3

    def initialize(number, intelligence,strength)
      @name = "#Player #{@number}"
      @number = number
      @intelligence = intelligence
      @strength = strength
      @health = @@INITIAL_HEALTH
      @row = 0
      @col = 0
      @consecutiveHits = 0
      @weapons = Array.new(0)
      @shields = Array.new(0) #duda
    end

    def resurrect
      @health = @@INITIAL_HEALTH
      @weapons.clear
      @shields.clear
    end

    attr_reader :row, :col, :nummber

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
      return (@strength + self.sumWeapons)
    end

    def sumWeapons
      sum = 0.0;
      for weapon in @weapons
        sum += weapon.attack
      end
      return sum
    end
      
    def sumShields
      sum = 0.0;
      for shield in @shields
        sum += shield.protect 
      end
      return sum
    end
    
    def defensiveEnergy
      return (@intelligence + self.sumShields)
    end

    def newWeapon
      _weapon = Weapon.new(Dice.weaponPower,Dice.usesLeft)
      return _weapon
    end

    def resetHits
      @consecutiveHits = 0
    end

    def gotWounded
      @health -= 1
    end

    def incConsecutiveHits
      @consecutiveHits += 1
    end
    


  end
  
end
