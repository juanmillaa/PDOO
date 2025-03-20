require_relative "GameCharacter"
require_relative "GameState"
require_relative "Directions"
require_relative "Orientation"
require_relative "Monster"
require_relative "Labyrinth"
require_relative "Dice"
require_relative "Player"

module Irrgarten
    class Game
        @@MAX_ROUNDS = 10
        @@NROWS = 5
        @@NCOLS = 4

        def initialize(nplayers)
            @log = ""
            @players = Array.new(nplayers)
            @players[0] = Player.new(0,1,1);
            @players[0].set_pos(0,3);
            @players[1] = Player.new(1,1,1);
            @players[1].set_pos(3,3);
            @monsters = Array.new(2)
            @monsters[0] = Monster.new(0,0.1,0.1);
            @monsters[1] = Monster.new(1,10.0,10.0)
            @currentPlayerIndex = Dice.who_starts(nplayers)
            @currentPlayer = @players[@currentPlayerIndex]
           
            @labyrinth = Labyrinth.new(@@NROWS, @@NCOLS, 0, 0)
            self.configure_labyrinth
        end

        def finished
            return @labyrinth.have_a_winner
        end

        def get_game_state
            sPlayers = ""
            for i in 0...@players.size
                sPlayers += @players[i].to_s + "\n"
            end
            sMonsters = ""
            for i in 0...@monsters.size
                sMonsters += @monsters[i].to_s + "\n"
            end

            gState = GameState.new(@labyrinth.to_s, sPlayers, sMonsters, @currentPlayerIndex, self.finished, @log)
            return gState
        end
        
        def configure_labyrinth
            @labyrinth.put_player(Directions::DOWN,@players[0]);
            @labyrinth.put_player(Directions::DOWN,@players[1]);
            @labyrinth.add_monster(0,2,@monsters[0]);
            @labyrinth.add_monster(3,1,@monsters[1]);
            @labyrinth.add_block(Orientation::HORIZONTAL, 2,1,3);
        end
        
        def next_player
            if (@currentPlayerIndex == @players.size - 1) then
                @currentPlayerIndex = 0
            else
                @currentPlayerIndex += 1
            end
            @currentPlayer = @players[@currentPlayerIndex]
        end

        def log_player_won
            @log += "El jugador ha ganado el combate \n"
        end

        def log_monster_won
            @log += "El monstruo ha ganado el combate \n"
        end

        def log_resurrected 
            @log += "El jugador ha resucitado \n"
        end

        def log_player_skip_turn 
            @log += "El jugador pierde el turno por estar muerto \n"
        end

        def log_player_no_orders
            @log += "El jugador no ha seguido las instrucciones del jugador humano \n"
        end

        def log_no_monster
            @log += "El jugador se ha movido a una celda vacia o no ha sido posible moverse \n"
        end

        def log_rounds(rounds, max)
            @log += "Se han producido #{rounds} rondas de un total de #{max} \n"
        end

        def actual_direction(preferred_direction)
            currentRow = @currentPlayer.row 
            currentCol = @currentPlayer.col
            validMoves = @labyrinth.valid_moves(currentRow, currentCol)
            output = @currentPlayer.move(preferred_direction,validMoves)
            return output
        end
        attr_reader :log
        def next_step(preferredDirection)
            @log = ""
            dead = @currentPlayer.dead 
            if(!dead)then
                direction = self.actual_direction(preferredDirection)
                if(direction != preferredDirection)then
                    self.log_player_no_orders
                end
                monster = @labyrinth.put_player(direction, @currentPlayer)
                if(monster == nil)then
                    self.log_no_monster
                else
                    winner = self.combat(monster)
                    self.manage_reward(winner)
                end
            else
                self.manage_resurrection
            end
            endGame = self.finished
            if(!endGame)then
                self.next_player
            end
            return endGame
        end

        def combat(monster)
            rounds = 0
            winner  = GameCharacter::PLAYER
            playerAttack = @currentPlayer.attack
            lose = monster.defend(playerAttack)
            while(!lose && rounds < @@MAX_ROUNDS) do
                winner = GameCharacter::MONSTER
                rounds += 1
                monsterAttack = monster.attack 
                lose = @currentPlayer.defend(monsterAttack)
                if(!lose)then
                    playerAttack = @currentPlayer.attack
                    winner = GameCharacter::PLAYER
                    lose = monster.defend(playerAttack)
                end
            end
            self.log_rounds(rounds, @@MAX_ROUNDS)
            return winner
        end

        def manage_resurrection
            resurrect = Dice.resurrect_player
            if(resurrect)then
                @currentPlayer.resurrect
                self.log_resurrected
            else
                self.log_player_skip_turn
            end
        end

        def manage_reward(winner)
            if(winner == GameCharacter::PLAYER)then
                @currentPlayer.receive_reward
                self.log_player_won
            else
                self.log_monster_won
            end
        end
        
        private :configure_labyrinth, :next_player, :actual_direction, :combat, :manage_reward, :manage_resurrection, :log_player_won, :log_monster_won, :log_resurrected, :log_player_skip_turn, :log_player_no_orders, :log_no_monster, :log_rounds
    end

end