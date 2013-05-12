/*
BLACKLIGHT v1.0
 Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.
 
 Author: Nuno Simaria - nsimaria@ua.pt - #23652
 Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
 */

class Level
{
  Game game = null;
  Battlefield battlefield = null;
  Blacklord      blacklord   = null;
  Blacklord      lightlord   = null;
  Scoreboard scoreboard = null;
  int timer = 0;
  
  Serial         port = null;

  //  Blackmatter [] blackmatter = {};
  //  Lightmatter [] lightmatter = null;
  String name = "Level Name";
  int width = 0;
  int height = 0;
  int[] balances = {
    127, 127, 127, 127, 127, 127
  };
  int rate = 60;

  void setup ()
  {
//        _game_.playIntro ();

    if (this.game == null)
    {
      println ("No Game defined for this Level");
      return;
    }  

    this.timer = 2000;
    
    this.battlefield = new Battlefield (1024, 768);
    this.lightlord = new Blacklord ();
    this.lightlord.evil = false;
    this.blacklord = new Blacklord ();
    this.scoreboard = new Scoreboard ();
    

    this.battlefield.level = this;
    this.lightlord.level = this;
    this.blacklord.level = this;  
    this.scoreboard.level = this;

    this.battlefield.setup ();
    this.lightlord.setup ();
    this.blacklord.setup ();
    this.scoreboard.setup ();
    

    String[] ports =  Serial.list ();

    if (ports.length == 1)
      return;

    if (_game_.leds != null)
    {
      this.port = _game_.leds;
    }
    
    
  }

  int balance ()
    {
    return this.battlefield.whites - this.battlefield.blacks;
    }

  void draw ()
  {
    this.battlefield.draw ();
    this.blacklord.draw ();
    this.lightlord.draw ();


/*    for (int i = 0; i < this.lightlord.minions [0].lighted.size (); i++)
    {
      int[] coords = (int []) this.lightlord.minions [0].lighted.get (i);

      Cell cell = this.battlefield.getCell (coords[0], coords[1]);
      //println ("balancing");
      cell.update(0);
    }
*/
    for (int i = 0; i < this.lightlord.blackmatter.size (); i++)
    {
      Blackmatter b = (Blackmatter) this.lightlord.blackmatter.get (i);      
      if (b.check ())
        continue;
        
      Cell cell = this.battlefield.getCell (b.x, b.y);
      cell.update(0);
    }


    for (int j = 0; j < this.blacklord.blackmatter.size (); j++)
    {
      Blackmatter b = (Blackmatter) this.blacklord.blackmatter.get (j);      
      if (b.check ())
        continue;
        
      Cell cell = this.battlefield.getCell (b.x, b.y);
      cell.update(1);
    }

    this.scoreboard.draw (); 

    //int balance = this.lightlord.balance ();

    // DESCOMENTAR!! LEDS
    if ((this.battlefield != null) && (this.battlefield.whites >= 0))
      this.output (this.battlefield.whites);
    else
      this.output (0);
      
    if ( this.timer <= 0 ) this.outcome ();
      this.timer--;


    //    this.blacklord.attack ();

    //    this.lightlord.defend ();
  }

  void loadXml (XML node)
  {
    this.name       = "First Level"; //node.getChild ("name").getContent ();
    this.width      = 20; //int (node.getChild ("width").getContent ());
    this.height     = 16;    

    //println ("Level " + name + ": " + this.width + "x" + this.height);
  }

  void output (int value)
  {
    //if (this.port != null) UNCOMMENT!!!!
      //this.por  t.write (value); UNCOMMENT!!!!

    //  value = value + increment;

    //  if (value >= 255)
    //    increment = -1;
    //  if (value <= 0)
    //    increment = 1;

    //  println (value);
  }

  void outcome ()
  {
    int score = this.battlefield.blacks - this.battlefield.whites;
    
    if ( score > 0 ) {
       _game_.blackWins ();
    } else if ( score < 0 ) {
      _game_.lightWins (); 
    } else {
     this.timer += 1000; 
    }
      
      
    
/*    this.rate--;

    if (this.rate == 0)
    {

      for (int i = 1; i < this.balances.length; i++)
        this.balances [this.balances.length - i] = this.balances [this.balances.length - i - 1];

      this.balances [0] = balance;
      if (balance == 0)
        _game_.playBlackPower ();
      else if (balance > 155)
        _game_.playLightPower ();

      this.rate = 60;
    }

    int total = 0;
    int blackpower = 0;
    int lightpower = 0;
    boolean consecutiveBlack = true;
    boolean consecutiveLight = true;
    for (int i = 0; i < this.balances.length; i++)
    {
      total += this.balances [i];

      if ((this.balances [i] == 0) && consecutiveBlack)
      {
        blackpower++;
        consecutiveLight = false;
      }
      else if ((this.balances [i] > 155) && consecutiveLight)
      {
        lightpower++;
        consecutiveBlack = false;
      }
      else
      {
        consecutiveLight = false;
        consecutiveBlack = false;
      }
    }

    if (blackpower > 0)
    {
      _game_.score (blackpower, 0);
    }
    else if (lightpower > 0)
    {
      _game_.score (lightpower, 1);
    }


    total = total / this.balances.length;

    if (blackpower == 6)
      _game_.blackWins ();
    else if (lightpower == 6)
      _game_.lightWins ();*/
  }
}

