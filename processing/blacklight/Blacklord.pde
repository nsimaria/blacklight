/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

class Blacklord
  {
  Level level = null;
  Blackminion [] minions = {};
  ArrayList blackmatter = null;
//  Blackmatter [] blackmatter = {};
  int power = 0;

  
  void setup ()
    {
    // procurar quantos nunchuks existem ligados ao sistema
    //e criar um Blackminion por cada nunchuk
    this.blackmatter = new ArrayList ();
    Blackminion minion1 = new Blackminion ();
    minion1.blacklord = this;
    minion1.input = (this.level.game.inputs.length != 0) ? this.level.game.inputs [0] : new Input ();
    
    this.minions = (Blackminion []) append (this.minions, minion1);
    
    minion1.setup ();
    }

   
  void draw ()
    {
    ellipseMode (CENTER);

    
    
    boolean died = false;
      
    for (int i = 0; i < this.blackmatter.size (); i++)
      {
        died = ((Blackmatter) this.blackmatter.get (i)).check ();
        if (died)
          {
//          _game_.playLightHit ();
          this.blackmatter.remove (i);
//          println (this.blackmatter.size ());
   //   _sc_.playAudioFile("light.wav");
            
          //splice (this.blackmatter, i+1, this.blackmatter.length - 1);  
//          if (i < (this.blackmatter.length - 2))
  //          arrayCopy (this.blackmatter, i + 1,  this.blackmatter, i, this.blackmatter.length - i -1);
          
//          this.blackmatter = (Blackmatter []) concat (subset (this.blackmatter, 0, i), subset (this.blackmatter, i, this.blackmatter.length - i));
          break;
          }
        
      }  
   
   // println (this.blackmatter.length);
   
    this.power = 0;
      
    for (int i = 0; i < this.blackmatter.size (); i++)
      {
      if (((Blackmatter)this.blackmatter.get (i)).dead)
        continue;

      ((Blackmatter)this.blackmatter.get (i)).draw ();
      this.power += 4;
      }
    
    for (int i = 0; i < this.minions.length; i++)
      {
      this.minions [i].draw ();
      }  

//    println (this.power);
    
    }
    
  void attack ()
    {
    
    }
  }
