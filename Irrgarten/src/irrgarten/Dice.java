package irrgarten;
import java.util.Random;
/**
 *
 * @author juanma
 */
public class Dice {

    private static int MAX_USES = 5 ;                                                   // (número máximo de usos de armas y escudos)
    private static float MAX_INTELLIGENCE = 10.0f;                           // (valor máximo para la inteligencia de jugadores y monstruos)
    private static float MAX_STRENGTH = 10.0f;                                  // (valor máximo para la fuerza de jugadores y monstruos)
    private static float RESURRECT_PROB = 0.3f;                                // (probabilidad de que un jugador sea resucitado en cada turno)
    private static int  WEAPONS_REWARD = 2;                                   // (numero máximo de armas recibidas al ganar un combate)
    private static int SHIELDS_REWARD = 3 ;                                     // (numero máximo de escudos recibidos al ganar un combate)
    private static int HEALTH_REWARD = 5 ;                                      // (numero máximo de unidades de salud recibidas al ganar un combate)
    private static float MAX_ATTACK = 3.0f;                                              // (máxima potencia de las armas)
    private static float  MAX_SHIELD = 2.0f;                                             // (máxima potencia de los escudos)
    
    private static Random generator = new Random();
    
    public int randomPos(int max){
        return generator.nextInt(max);
    }
    
    public int whoStarts(int nplayers){
        return generator.nextInt(nplayers);
    }
    
    public float randomIntelligence(){
        return (generator.nextFloat()*MAX_INTELLIGENCE);
    }
    
    public float randomStrength(){
        return (generator.nextFloat()*MAX_STRENGTH);
    }
    
    public boolean resurrectPlayer(){
        return generator.nextBoolean();
    }
   
    public int weaponsReward(){
        return generator.nextInt(WEAPONS_REWARD + 1);
    }
    
    public int shieldsReward(){
        return generator.nextInt(SHIELDS_REWARD + 1);
    }
    
    public int healthReward(){
        return generator.nextInt(HEALTH_REWARD + 1);
    }
    
    public float weaponPower(){
        return (generator.nextFloat()*MAX_ATTACK);
    }
    
    public float shieldPower(){
        return (generator.nextFloat()*MAX_SHIELD);
    }
    
    public int usesLeft(){
        return generator.nextInt( MAX_USES + 1);
    }
    
    public float intensity(float competence){
        return (generator.nextFloat()*competence);
    }
    
    public boolean discardElement(int usesLeft){
        boolean estado;
        if(usesLeft == 0){
            estado = true;
        }else if(usesLeft == MAX_USES){
            estado = false;
        }else{
            float probabilidad = (float)((MAX_USES - usesLeft) *(1/MAX_USES));
            if(generator.nextFloat() < probabilidad)
                    estado = true;
            else
                   estado = false;
        }
        return estado;
    }
    
}
