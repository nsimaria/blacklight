class Sphere 
  {
  Universe universe;
  int id    = -1;	
  	
  float  x0 = 0;
  float  y0 = 0;
  float  z0 = 0;

  float v0x = 0;
  float v0y = 0;
  float v0z = 0;
  
  float x = 0;
  float y = 0;
  float z = 0;
  
  int red = 0;
  int green = 0;
  int blue = 0;
  
  int steps  = 0;
  int radius = 100;
  
  boolean destroyed = false;
  
  void be ()
    {
    x = x0;
    y = y0;
    z = z0;
    }
  
  void draw ()
    {
    fill (0, 125);
    noStroke ();
//    stroke (0, 255, 0);
      
    if (destroyed)
      {
      return;
      }

    ellipse (x, y, radius * 2, radius * 2);
    }
    

  void step ()
    {
    x = x0 + v0x * steps + 0.5 * universe.gravityX * steps * steps;
    y = y0 + v0y * steps + 0.5 * universe.gravityY * steps * steps;
    z = z0 + v0z * steps + 0.5 * universe.gravityZ * steps * steps;
    
    if ((y >= _height_) || (y <= 0))
      {
      v0y = -(v0y + (universe.gravityY * steps));
      //x0 = x;
      //y = 999;
      y0 = y;
      x0 = x;
      z0 = z;
      steps = 0;
      //radius = 20;
      //z0 = z;
      }
    else if ((x >= _width_) || (x <= 0))
      {
      v0x = -(v0x + (universe.gravityX * steps));
      //x0 = x;
      //y = 999;
      y0 = y;
      x0 = x;
      z0 = z;
      steps = 0;
      //radius = 20;
      //z0 = z;
      }

    if (_blight_.detector.isLighted (x, y))
      {
      this.split ();
      }

    steps++;
    radius++;
    }
    
  void split ()
    {
    radius = radius / 2;
    
    if (destroyed)
      {
      return;
      }

    if (radius < universe.threshold_radius)
      {
      destroyed = true;
      if (universe.gameover ())
        {
        //GAMEOVER = true;
        }
      return;
      }

    x0 = x + universe.bounceX;
    y0 = y;
    z0 = z;

    v0x = (v0x + (universe.gravityX * steps)) + 5;
    v0y = (v0y + (universe.gravityY * steps));
    v0z = (v0z + (universe.gravityZ * steps));

    
    steps = 0;

    
    Sphere s = new Sphere ();
    
    s.red   = red;
    s.green = green;
    s.blue  = blue;
    
    s.x0 = x0- (universe.bounceX * 2);
    s.y0 = y0;
    s.z0 = z0;
    
    s.v0x = v0x - (universe.bounceSpeed * 2);
    s.v0y = v0y;
    s.v0z = v0z;


    v0x = universe.bounceSpeed;
    
    s.radius = radius;
    
    universe.add (s);
    
    println (universe.elements.length);
    //steps++;
    //radius += 5;
    }  
    
  }
