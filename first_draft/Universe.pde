class Universe 
  {
  float gravityX = 0;
  float gravityY = 2;
  float gravityZ = 0;
  float threshold_radius = 20;
  float bounceX = 10;
  float bounceSpeed = 0;
  float speed = 10;

  int size = 100;
  int steps = 0;
  Sphere[] elements = {}; 
  
   void draw ()
     {
     boolean allDestroyed = true;
       
     for (int i = 0; i < elements.length; i++)
       {
       allDestroyed = allDestroyed && elements [i].destroyed;
       elements [i].draw ();
       }
     
     if (allDestroyed)
       {
       this.end ();
       }
     
     step ();
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
      
  /*    if (SPHERE_START == SPHERE_START_MODE_POINT)
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
    */  
    //TEMP
        s.x0  =  random (_width_);
        s.y0  =  random (_height_);
        s.z0  =  (float) 0;


      s.v0x =   random (speed) - (speed / 2);
      s.v0y =   random (speed) - (speed / 2);
      s.v0z =   random (speed) ;

      add (s);      
      s.be ();
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
     
   void end ()
     {
     box (100, 100, 100);
     }
  }
