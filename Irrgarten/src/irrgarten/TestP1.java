package irrgarten;
/**
 *
 * @author juanma
 */
public class TestP1 {
    
    public static void main(String[] args){
        
         Shield escudo = new Shield(2.4f,1);
         System.out.println(escudo.toString());
         System.out.println(escudo.protect());
         System.out.println(escudo.discard());
        
         System.out.println();
         
         Shield escudo1 = new Shield(4.3f,0);
         System.out.println(escudo1.toString());
         System.out.println(escudo1.protect());
         System.out.println(escudo1.discard());
         
         System.out.println();
         
         Shield escudo2 = new Shield(0.5f,5);
         System.out.println(escudo2.toString());
         System.out.println(escudo2.discard());
         System.out.println(escudo2.protect());
        
         System.out.println();
         
         Weapon arma = new Weapon(2.4f,1);
         System.out.println(arma.toString());
         System.out.println(arma.attack());
         System.out.println(arma.discard());
         System.out.println();
         
         System.out.println();
         
         Weapon arma1 = new Weapon(4.3f,0);
         System.out.println(arma1.toString());
         System.out.println(arma1.attack());
         System.out.println(arma1.discard());
         
         System.out.println();
         
         Weapon arma2 = new Weapon(0.5f,5);
         System.out.println(arma2.toString());
         System.out.println(arma2.discard());
         System.out.println(arma2.attack());
         
         
         System.out.println(Dice.weaponPower());
         
         System.out.println();
         
         System.out.println();
         
         System.out.println();
         
         System.out.println();
         
         System.out.println();
         
         System.out.println();
         
         System.out.println();


                  

    }
    
}
