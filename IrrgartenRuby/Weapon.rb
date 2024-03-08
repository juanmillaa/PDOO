module Irrgarten
  def class Weapon::
    def initialize(iPower, iUses)
      @power = iPower
      @uses = iUses
    end
    
    def attack
      if(@uses > 0) then
        @uses -= 1
        return @power
      end
      0
    end

    def to_s
      "W[#{@power}, #{@uses}]"
    end
    
    def discard
      Dice.discardElement(@uses)
    end


  end
  
end
