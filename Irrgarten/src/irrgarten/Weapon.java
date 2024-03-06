package irrgarten;

/**
 *
 * @author juanma
 */
public class Weapon {

    private float power;
    
    private int uses;
    
    public Weapon (float iPower, int iUses){
        power = iPower;
        uses = iUses;
    }
    
    float attack(){
        if(uses > 0){
            uses--;
            return power;
        }
        return 0;
    }
    
    public String toString(){
        String _power = Float.toString(power);
        String _uses = Integer.toString(uses);
        String cadena  = "W[" + _power + ", " + _uses + "]";
        return cadena;
    }
    
}
