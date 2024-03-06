package irrgarten;

/**
 *
 * @author juanma
 */
public class Shield {

    private float protection;
    
    private int uses;
    
    public Shield(float iProtection, int iUses){
        protection = iProtection;
        uses = iUses;
    }
    public float protect(){
        if(uses > 0 ){
            uses--;
            return protection;
        }
        return 0;
    }
    
    public boolean discard(){
        return Dice.discardElement(uses);
    }
    
    public String toString(){
        String _protection = Float.toString(protection);
        String _uses = Integer.toString(uses);
        String cadena  = "S[" + _protection + ", " + _uses + "]";
        return cadena;
    }
}
