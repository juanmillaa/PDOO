package irrgarten;
/**
 *
 * @author juanma
 */
public class Monster {
    
    private static int INITIAL_HEALTH = 5;
    private String name;
    private float  strength;
    private float health;
    private int row;
    private int col;
    
    public Monster(String name, float strength, float health){
        this.name = name;
        this.strength = strength;
        this.health = health;
    }
    
    public boolean dead(){
        return (health <= 0);
    }
    
    public float attack(){
        return Dice.intensity(strength);
    }
    
    public void setPos(int row,int col){
        this.row = row;
        this.col = col;
    }
    
    public String toString(){
        return (name + "[" + strength + ", " + health + "]");
    }

    private void gotWounded(){
        --health;
    }
    
    //public boolean defend(float receivedAttack);
    
}
