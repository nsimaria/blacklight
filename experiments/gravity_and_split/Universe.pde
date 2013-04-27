
class Universe 
  {
  int size = 100;
  int steps = 0;
  Sphere[] elements = {}; 
  
  void be ()
    {
    println ("Universe.be");
    
    for (int i = 0; i < size; i++)
      {
      Sphere s = create ();
      add (s);
      s.be ();
      }
    }
   
   void draw ()
     {
     for (int i = 0; i < elements.length; i++)
      {
      	elements [i].draw ();
      }
     }
     
   void step ()
     {
     for (int i = 0; i < elements.length; i++)
      {
      	elements [i].step ();
      }
      
     steps++;
     }

   Sphere create ()
     {
     	Sphere s = new Sphere ();
      // random initial position
      //s.x0  =  (int) random (width);
      //s.y0  =  (int) random (height);
      //s.z0  =  -(int) random (width);

      s.red    =  (int) random (255);
      s.green  =  (int) random (255);
      s.blue   =  (int) random (255);
      
      if (SPHERE_START == SPHERE_START_MODE_POINT)
        {
        s.x0  =  (float) SPHERE_STARTX;
        s.y0  =  (float) SPHERE_STARTY;
        s.z0  =  (float) SPHERE_STARTZ;
        }
      else if (SPHERE_START == SPHERE_START_MODE_RANDOM)
        {
        s.x0  =  random (WIDTH);
        s.y0  =  random (HEIGHT);
        s.z0  =  (float) SPHERE_STARTZ;
        }
      
      s.v0x =   random (SPEED) - (SPEED / 2);
      s.v0y =   random (SPEED) - (SPEED / 2);
      s.v0z =   random (SPEED) ;
     return s;
     }
     
   void add (Sphere s)
     {
     s.id = elements.length;
     s.universe = this;
     	
     elements = (Sphere [])append (elements, s);
     }
     
   boolean gameover ()
     {
     boolean gameover = true;
     
     for (int i = 0; i < elements.length; i++)
       {
       gameover &= elements [i].destroyed;
       
       if (!gameover)
         return false;
       }
       
     return true;
     }
  }