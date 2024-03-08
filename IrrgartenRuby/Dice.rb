module Irrgarten
  def class Dice::

    @@MAX_USES = 5
    @@MAX_INTELLIGENCE = 10.0
    @@MAX_STRENGTH = 10.0
    @@MAX_STRENGTH = 10.0                              
    @@RESURRECT_PROB = 0.3                              
    @@WEAPONS_REWARD = 2                                 
    @@SHIELDS_REWARD = 3                                  
    @@HEALTH_REWARD = 5                                       
    @@MAX_ATTACK = 3.0                                     
    @@MAX_SHIELD = 2.0   

    @@generator = Random.new

    def self.randomPos(max)
      @@generator.rand(max)
    end

    def self.whoStarts(nplayers)
      @@generator.rand(nplayers)
    end

    def self.randomIntelligence()
      @@generator.rand(MAX_INTELLIGENCE)
    end

    def self.randomStrength()
      @@generator.rand(MAX_STRENGTH)
    end

    def self.resurrectPlayer()
      resurrect = false
      if(@@generator.rand(1.0) < @@RESURRECT_PROB)
        resurrect = true
      end
      resurrect
    end

    def self.weaponsReward
      @@generator.rand(@@WEAPONS_REWARD + 1)
    end

    def self.shieldsReward
      @@generator.rand(@@SHIELDS_REWARD + 1)
    end

    def self.healthReward
      @@generator.rand(@@HEALTH_REWARD + 1)
    end

    def self.weaponPower
      @@generator.rand(@@MAX_ATTACK)
    end

    def self.shieldPower
      @@generator.rand(@@MAX_SHIELD)
    end

    def self.usesLeft
      @@generator.rand(@@MAX_USES + 1)
    end

    def self.intensity(competence)
      @@generator.rand(competence.to_f)
    end


    def self.discardElement(int usesLeft)
      if(usesLeft == 0) then 
        estado = true
      elsif(usesLeft == @@MAX_USES) then
        estado = false
      else
        probabilidad = ((@@MAX_USES - usesLeft) * (1.0/@@MAX_USES))
        if(@@generator.rand(1.0) < probabilidad) then
          estado = true
        else
          estado = false
        end
      end
      estado
    end

  end
  
end
