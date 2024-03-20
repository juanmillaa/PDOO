module Irrgarten
  class Labyrinth
    @@BLOCK_CHAR = 'X'
    @@EMPTY_CHAR = '-'
    @@MONSTER_CHAR = 'M'
    @@COMBAT_CHAR = 'C'
    @@EXIT_CHAR = 'E'
    @@ROW = 0
    @@COL = 1

    def initialize(nRows, nCols, exitRow, exitCol)
      @nRows = nRows
      @nCols = nCols
      @exitRow = exitRow
      @exitCol = exitCol
      @monsters = Array.new(@nRows){Array.new(@nCols)}
      @players = Array.new(@nRows){Array.new(@nCols)}
      @characters = Array.new(@nRows){Array.new(@nCols,@@EMPTY_CHAR)}
      @characters[@exitRow][@exitCol] = @@EXIT_CHAR
    end

    def haveAWinner
      return (@players[@exitRow][@exitCol] != nil)
    end
    
    def to_s
      cadena = "LABERINTO:\tNºFilas = #{@nRows}\tNºColumnas = #{@nCols} \n"
      for i in 0...@nRows
        for j in 0...@nCols
          cadena += @characters[i][j] + "  "
        end
        cadena += "\n"
      end
      return cadena
    end

    def addMonster(row,col,monster)
      if(posOK(row,col) && emptyPos(row,col)) then
        @characters[row][col] = @@MONSTER_CHAR
        monster.setPos(row,col)
        @monsters[row][col] = monster
      end
    end

    def posOK(row,col)
      return (0 <= row && row < @nRows && 0 <= col && col < @nCols)
    end

    def emptyPos(row,col)
      if(posOK(row,col)) then
        return (@characters[row][col] == @@EMPTY_CHAR)
      end
      return false
    end

    def monsterPos(row,col)
      if(posOK(row,col)) then
        return (@characters[row][col] == @@MONSTER_CHAR)
      end
      return false
    end

    def exitPos(row,col)
      if(posOK(row,col)) then
        return (@characters[row][col] == @@EXIT_CHAR)
      end
      return false
    end

    def combatPos(row,col)
      if(posOK(row,col)) then
        return (@characters[row][col] == @@COMBAT_CHAR)
      end
      return false
    end

    def canStepOn(row,col)
      if(posOK(row,col)) then
        return (emptyPos(row,col) || monsterPos(row,col) || exitPos(row.col))
      end
      return false
    end

    def updateOldPos(row,col)
      if(posOK(row,col))then
        if(combatPos(row,col))then
          @characters[row][col] = @@MONSTER_CHAR
        else
          @characters[row][col] = @@EMPTY_CHAR
        end
        @players[row][col] = nil
      end
    end

    def dir2Pos(row,col, direction)
      pos = Array.new(2)
      final_row = row
      final_col = col
      case direction
      when Directions::LEFT
        final_col -= 1
      when Directions::RIGHT
        final_col += 1
      when Directions::UP
        final_row -= 1
      when Directions::DOWN
        final_row += 1
      end
      pos[0] = final_row
      pos[1] = final_col
      return pos
    end

    def randomEmptyPos
      pos = Array.new(2)
      state = true
      while(state)
        pos[0] = Dice.randomPos(@nRows)
        pos[1] = Dice.randomPos(@nCols)
        if(emptyPos(pos[0],pos[1]))then
          state = false
        end
      end
      return pos
    end  
  end
  
end
