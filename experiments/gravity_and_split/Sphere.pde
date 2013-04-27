


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
  int radius = SPHERE_RADIUS;
  
  boolean destroyed = false;
  
  void be ()
    {
    x = x0;
    y = y0;
    z = z0;
    }
  
  void draw ()
    {
    if (destroyed)  
      {
      return;
      }
    translate (x, y, z);
    fill (red, green, blue);
    sphere (radius);
    translate (-x, -y, -z);
    }
    
/*
v = v0 + at
x = x0 + v0t + 1/2at^2
v^2 = v0^2 + 2a(x-x0)
*/

  void step ()
    {
    x = x0 + v0x * steps + 0.5 * GRAVITYX * steps * steps;
    y = y0 + v0y * steps + 0.5 * GRAVITYY * steps * steps;
    z = z0 + v0z * steps + 0.5 * GRAVITYZ * steps * steps;
    
    if (y >= 1200)
      {
      v0y = -(v0y + (GRAVITYY * steps));
      //x0 = x;
      //y = 999;
      y0 = y;
      x0 = x;
      z0 = z;
      steps = 0;
      //radius = 20;
      //z0 = z;
      }
    steps++;
    //radius++;
    }
    
  void split ()
    {
    radius = radius / 2;
    
    if (destroyed)
      {
      return;
      }

    if (radius <= 0.25 * SPHERE_RADIUS)
      {
      destroyed = true;
      if (universe.gameover ())
        {
        GAMEOVER = true;
        }
      return;
      }

    x0 = x + BOUNCEX_DISPLACEMENT;
    y0 = y;
    z0 = z;

    v0x = (v0x + (GRAVITYX * steps)) + 5;
    v0y = (v0y + (GRAVITYY * steps));
    v0z = (v0z + (GRAVITYZ * steps));

    
    steps = 0;

    
    Sphere s = new Sphere ();
    
    s.red   = red;
    s.green = green;
    s.blue  = blue;
    
    s.x0 = x0- (BOUNCEX_DISPLACEMENT * 2);
    s.y0 = y0;
    s.z0 = z0;
    
    s.v0x = v0x - (BOUNCEX_SPEED * 2);
    s.v0y = v0y;
    s.v0z = v0z;


    v0x = + BOUNCEX_SPEED;
    
    s.radius = radius;
    
    universe.add (s);
    
    println (universe.elements.length);
    //steps++;
    //radius += 5;
    }  
    
  }
