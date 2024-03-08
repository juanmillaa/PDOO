package irrgarten;
import java.util.ArrayList;
/**
 *
 * @author juanma
 */
public class Player {
    
    private static final int MAX_WEAPONS = 2;
    private static final int MAX_SHIELDS = 3;
    private static int INITIAL_HEALTH  = 10;
    private static final int HITS2LOSE = 3;
    
    ArrayList<Weapon> weapons;
    ArrayList<Shield> shields;
    
    private String name;
    private char number;
    private float intelligence;
    private float strength;
    private float  health;
    private int row;
    private int col;
    private int consecutiveHits = 0;
    
    public Player(char number, float intelligence, float strength){
        this.name = "#Player" + number;
        this.number = number;
        this.intelligence = intelligence;
        this.strength = strength;
        this.health = INITIAL_HEALTH;
    }
    
    public void resurrect(){
        health = INITIAL_HEALTH;
        weapons.clear();
        shields.clear();
    }
    
    public int getRow(){
        return row;
    }
    
    public int getCol(){
        return col;
    }
    
    public char getNumber(){
        return number;
    }
    
    public void setPos(int row, int col){
        this.row = row;
        this.col = col;
    }
    
    public boolean dead(){
        return (health <= 0);
    }
    
//   public Directions move(Directions direction, Directions[] validMoves){
//       
//   }
    
    public float attack(){
        return (this.strength + this.sumWeapons());
    }
    
//    public boolean defend(float receivedAttack){
//        
//    }
    private float sumWeapons(){
        float sum = 0;
        for(int i = 0; i < weapons.size(); i++){
            sum += weapons.get(i).attack();
        }
        return sum;
    }
    private float sumShields(){
        float sum = 0;
        for(int i = 0; i < shields.size(); i++){
            sum += shields.get(i).protect();
        }
        return sum;
    }
    
    private float defensiveEnergy(){
        return (this.intelligence + this.sumShields());
    }
    private Weapon newWeapon(){
        Weapon _weapon =new Weapon(Dice.weaponPower(),Dice.usesLeft());
        return _weapon;
    }
    
    private Shield newShield(){
        Shield _shield =new Shield(Dice.shieldPower(),Dice.usesLeft());
        return _shield;
    }
    
    private void resetHits(){
        this.consecutiveHits =0;
    }
    
    private void gotWounded(){
        this.health--;
    }
    
    private void incConsecutiveHits(){
        this.consecutiveHits++;
    }
    
}
