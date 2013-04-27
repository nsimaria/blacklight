/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

class Lightlord
  {
  Level level = null;
  Lightminion [] minions = {};
  Lightmatter [] matter = {};
  
  void setup ()
    {
    Lightminion minion1 = new Lightminion ();
    minion1.lightlord = this;
    this.minions = (Lightminion []) append (this.minions, minion1);
    minion1.setup ();
    }
    
  void draw ()
    {
    for (int i = 0; i < this.minions.length; i++)
      this.minions [i].draw ();
    
    }
    

  int balance ()
    {
    int power = 255;  
    power = power - _game_.current.blacklord.power;
    
    if (power < 0)
      power = 0;
      
    return power;
    }
  
  }


//import JMyron.*;


/*class Lightlord
  {
  Level level = null;
  JMyron source = null;
//  Lightmap lightmap = null;

  float[] source_size   = {320, 240};
  int[] lightmap_size = {32, 24};
  float[] screen_size   = {320, 240};
  float[] size_factors  = {1, 1};
  float[] step_factors  = {32, 24};  

  void setup ()
    {
    if (this.level == null)
      {
      println ("No Level defined for this Lightlord");
      return;
      }

    this.screen_size [0] =  this.level.game.width;
    this.screen_size [1] =  this.level.game.height;
    this.lightmap_size [0] =  this.level.width;
    this.lightmap_size [1] =  this.level.height;
     
    source = new JMyron();//make a new instance of the object
    source.start(int (this.source_size[0]), int (this.source_size[1]));//start a capture at 320x240

    size_factors [0] = this.screen_size [0] / this.source_size [0];
    size_factors [1] = this.screen_size [1] / this.source_size [1];
    
/*    this.lightmap = new Lightmap (lightmap_size [0], lightmap_size [1]);
    this.lightmap.lightlord = this;
    this.lightmap.setup ();
  /  
    }
    
  void draw ()
    {
    ellipseMode (CORNER);

    source.update();
    int[] raw = source.image();
    
//    lightmap.update (raw);
    }
    
  void defend ()
    {
    
    }
  }
  */
