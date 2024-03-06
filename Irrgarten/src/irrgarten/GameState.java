package irrgarten;
/**
 *
 * @author juanma
 */
public class GameState {

    private String labyrinthv;
    private String players;
    private String monsters;
    private int currentPlayer;
    private boolean winner;
    private String log;
    
    public GameState(String iLab, String iPlay, String iMons, int iCurr, boolean iWin, String iLog){
        labyrinthv = iLab;
        players = iPlay;
        monsters = iMons;
        currentPlayer = iCurr;
        winner = iWin;
        log = iLog;
    }
    
    public String getLabyrinthv(){
        return labyrinthv;
    }
    
    public String getPlayers(){
        return players;
    }
    
    public String getMonsters(){
        return monsters;
    }
    
    public int getCurrentPlayer(){
        return currentPlayer;
    }
    
    public boolean getWinner(){
        return winner;
    }
    
    public String getLog(){
        return log;
    }
  
}
