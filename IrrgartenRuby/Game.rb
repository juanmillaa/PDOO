module Irrgarten
    class Game
        @@MAX_ROUNDS = 10
        @@NROWS = 10
        @@NCOLS = 10

        def initialize(nplayers)
            @log = ""
            for i in 0...nplayers
                _player = Player.new(i,Dice.)

        end



    end

end