/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

class Blackminion
  {
  int x = 200;
  int y = 200;
  int diameter = 50;
  Input input = null;  
  Blacklord blacklord = null;
  
  boolean jammed = false;
  int timeout = 0;
  int charging = 0;
  
  void setup ()
    {
      
    }
    
  void draw ()
    {

    if (this.timeout != 0)
      {
      this.timeout--;
      
      if (this.timeout <= 0)
        this.jammed = false;
      }
      
    if (this.charging > 0)
      this.charging--;


//    println (this.input.horizontal () + ", " + this.input.vertical ());
    this.x = this.x + (this.input.horizontal ()/10);  
    this.y = this.y + (this.input.vertical ()/10);  
    
    if (this.x >= _game_.width - 10 - this.diameter)
      this.x = _game_.width - 10 - this.diameter;
    if (this.y >= _game_.height - 10 - this.diameter)
      this.y = _game_.height - 10 - this.diameter;
    if (this.x <= this.diameter + 10)
      this.x = this.diameter + 10;
    if (this.y <= this.diameter + 10)
      this.y = this.diameter + 10;
    
//    if (this.input.fire () && (this.jammed == false))
//      {
//      println ("FIRE!!!");
      this.fire ();
     // this.jammed = true;
     // this.timeout = 10;
//      }
     if (this.input.fire () && (this.charging == 0))
      {
      this.bomb ();
      this.charging = 30;
//      _game_.playBlackBomb ();
      }
    
    fill (1);
    noStroke();
    ellipse (this.x, this.y, this.diameter, this.diameter);
    }
    
  void fire ()
    {
      
    Blackmatter matter = new Blackmatter ();
    
    matter.x = this.x;
    matter.y = this.y;
    
    matter.setup ();
    this.blacklord.blackmatter.add (matter);
    
    }
    
  void bomb ()
    {
//      _game_.playBlackBomb ();

      for (int i = 0; i < 10; i++)
      {
      Blackmatter matter = new Blackmatter ();
    
//      matter.x = int (random (20, _game_.width - 20));
//      matter.y = int (random (20, _game_.height - 20));

      matter.x = this.x; //int (random (20, _game_.width - 20));
      matter.y = this.y; // int (random (20, _game_.height - 20));
      matter.vx = random (-5, 5);
      matter.vy = random (-5, 5);

    
      matter.setup ();
      this.blacklord.blackmatter.add (matter);
      }
    }
  }
