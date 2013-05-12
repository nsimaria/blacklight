


class Blackmatter
  {
  int x = 0;
  int y = 0;  
  int diameter = 50;
  boolean dead = false;
  float vx = 0;
  float vy = 0;
  boolean evil = true;
  
  void setup ()
    {
    
    }
   
  void draw ()
    {
    if (this.dead)
      return;

    if (this.evil)
        fill (10, 50);
    else
        fill (255, 50);
      
    noStroke ();

    ellipse (this.x, this.y, this.diameter, this.diameter);
    
    
    if ( ( this.x + vx <= 0 ) || ( this.x + vx >= _game_.width) ) {
          this.vx = -vx;
    }
    if ( ( this.y + vy <= 0 ) || ( this.y + vy >= _game_.height) ) {
          this.vy = -vy;
    }

    this.x += vx;
    this.y += vy;
   

    if (this.diameter > 0)
      this.diameter--;
    
    
    }
    
  boolean check ()
    {
    if (this.diameter <= 0)
      return true;
      
    return false;
    
    /*
    if (this.dead)
      return false;
      
    if ((_game_.current.lightlord.minions.length == 0) || (_game_.current.lightlord.minions [0].lighted == null))
      return false;  
      
    for (int i = 0; i < _game_.current.lightlord.minions [0].lighted.size (); i++)
      {
      int[] coords = (int []) _game_.current.lightlord.minions [0].lighted.get (i);
      
      Cell cell = _game_.current.battlefield.getCell (coords[0], coords[1]);
      println ("balancing");
      cell.balance++;
      
      if ((coords [0] < this.x + 40) && (coords [0] > this.x - 40) && (coords [1] < this.y + 40) && (coords [1] > this.y - 40))
        {
        this.dead = true;
        return true;
        }
      }
    
    return false;
 */  
  }
  }
