class Detector
  {
  JMyron cam;
  
  float camwidth  = 640;
  float camheight = 480;
  float width_factor;
  float height_factor;
  float r, g, b, av;
  
  Point[] lighted = {};
  
  Detector ()
    {
    cam = new JMyron();           //make a new instance of the object
    cam.start((int)camwidth, (int)camheight);          //start a capture at 320x240
    cam.findGlobs(0);             //disable the intelligence to speed up frame rate
    
    this.width_factor  = _width_/this.camwidth;
    this.height_factor = _height_/this.camheight;
    }

  boolean isLighted (float x, float y)
    {
    for (int i = 0; i < this.lighted.length; i++)
      {
      if ((x > this.lighted [i].x - 5) && (x < this.lighted [i].x + 5) && (y > this.lighted [i].y - 5) && (y < this.lighted [i].y + 5))
        return true;
      }
      
    return false;
    }
    
  void draw ()
    {
    fill (255, 125);
    noStroke ();  
    
    cam.update();              
    int[] img = cam.image();  //get the normal image of the camera

    for(int y = 0; y < camheight; y += 5)
      {
      for(int x = 0;x < camwidth; x += 5)
        {
        r = red   (img [y * (int) camwidth + x]);
        g = green (img [y * (int) camwidth + x]);
        b = blue  (img [y * (int) camwidth + x]);

        av = (r + g + b)/3.0;

        if (av < 240)
          continue;
 
        float inverted_x = x * (-width_factor) + _width_;
 
        Point p = new Point ();
//        p.x = x * width_factor;
        p.x = inverted_x;
        p.y = y * height_factor;
        
        lighted = (Point [])append (lighted, p);
       
        fill(r, g, b);
//        rect (x * width_factor , y * height_factor, 5* width_factor, 5*height_factor);
        ellipse (inverted_x, y * height_factor, 5* width_factor, 5*height_factor);
        }
      }
    }
  }
