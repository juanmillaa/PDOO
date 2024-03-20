require_relative "GameState"
require_relative "Dice"
require_relative "Shield"
require_relative "Weapon"
require_relative "Labyrinth"
require_relative "Monster"
require_relative "Directions"

module Irrgarten
    class TestP1

        def main 
            puts "Hola"
            d = Labyrinth.new(3,3,0,1)
            m = Monster.new("pepe",1,2)
            d.addMonster(1,2,m)
            puts d.to_s
            puts d.haveAWinner
            v = d.dir2Pos(1,1,Directions::UP)
            puts v
        end

    end

    TestP1.new.main
end