module Irrgarten
  class Shield
    def initialize(iProtection, iUses)
      @protection = iProtection
      @uses = iUses
    end
    
    def protect
      if(@uses > 0) then
        @uses -= 1
        return @protection
      end
      0
    end

    def to_s
      "S[#{@protection}, #{@uses}]"
    end

    def discard
      Dice.discardElement(@uses)
    end


  end
  
end
