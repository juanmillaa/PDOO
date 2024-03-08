module Irrgarten
  def class GameState::

    def initialize(iLab, iPlay, iMons, iCurr, iWin, iLog)
      @labyrinthv = iLab
      @players = iPlay
      @monsters = iMons
      @currentPlayer = iCurr
      @winner = iWin
      @log = iLog
    end

    attr_reader :labyrinthv
    attr_reader :players
    attr_reader :monsters
    attr_reader :currentPlayer
    attr_reader :winner
    attr_reader :log

  end
  
end
