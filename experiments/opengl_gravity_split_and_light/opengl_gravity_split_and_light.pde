import processing.opengl.*;

int WIDTH  = 1200;
int HEIGHT = 800;

int POPULATION = 20;

int BGCOLOR   = 0;
int FILLCOLOR = 100;

int ORIGINX = 0;
int ORIGINY = 0;
int ORIGINZ = 0;

int SPHERE_RADIUS = 100;

String SPHERE_START_MODE_POINT  = "point";
String SPHERE_START_MODE_RANDOM = "random";
String SPHERE_START  = SPHERE_START_MODE_RANDOM;

int SPHERE_STARTX = WIDTH / 2;
int SPHERE_STARTY = HEIGHT / 2;
int SPHERE_STARTZ = -3000;

int GRAVITYX = 0;
int GRAVITYY = 50;
int GRAVITYZ = 0;

int SPEED = 20;
int BOUNCEX_SPEED = 20;
int BOUNCEX_DISPLACEMENT = 20;

float vwidth  = 640;
float vheight = 480;
  
float factorw = (WIDTH/vwidth);
float factorh = (HEIGHT/vheight);

Universe universe;
boolean GAMEOVER = false;


import JMyron.*;

JMyron m;

void config ()
  {
  size (WIDTH, HEIGHT, OPENGL);  // setting stage size
  background (BGCOLOR);       // setting bg color
  fill (FILLCOLOR);           // setting fill color

  m = new JMyron();           //make a new instance of the object
  m.start(640, 480);          //start a capture at 320x240
  m.findGlobs(0);             //disable the intelligence to speed up frame rate

  noStroke ();                // disabling stroke
  }






void be ()
  {
  universe = new Universe ();
  universe.size = POPULATION;
  universe.be (); 
  }








void setup()
  {
  config ();
  be (); 
  }

Point[] lighted = {};

void draw()
  {
  background(0);
  m.update();             //update the camera view
  int[] img = m.image();  //get the normal image of the camera
  float r, g, b, av;

  for(int y = 0; y < vheight; y += 5)
    {
    for(int x = 0;x < vwidth; x += 5)
      {
      r = red   (img [y * (int) vwidth + x]);
      g = green (img [y * (int) vwidth + x]);
      b = blue  (img [y * (int) vwidth + x]);

      av = (r + g + b)/3.0;

      if (av < 230)
        continue;
 
      Point p = new Point ();
      p.x = x * factorw;
      p.y = y * factorh;
       
      lighted = (Point[])append (lighted, p);

   
      stroke(r, g, b);
      point (x * factorw , y * factorh, 0);
      }
    }
    
    
  noStroke ();  
  fill (200);
  translate (ORIGINX, ORIGINY, ORIGINZ);

  int overSphere = -1;

  for(int i = 0; i < universe.elements.length; i++)
    {
    if (universe.elements [i].destroyed)
      continue;
    int x = int (screenX(universe.elements[i].x, universe.elements[i].y, universe.elements[i].z));
    int y = int (screenY(universe.elements[i].x, universe.elements[i].y, universe.elements[i].z));
    
    float diameter = 10; //universe.elements[i].radius / 2;
    
    for (int j = 0; ((j < lighted.length) && (overSphere < 0)); j++)
      {
      if ((x > (lighted[j].x - diameter)) && (x < (lighted[j].x + diameter)) && (y > (lighted[j].y - diameter)) && (y < (lighted[j].y + diameter))) 
        {
        overSphere = i;
        }
      }
    }

  if (overSphere >= 0)
    {
    universe.elements [overSphere].split ();
    }



  if (!GAMEOVER)
    {
    universe.draw ();
    universe.step ();
    }
  else
    {
    translate (width / 2, height / 2, 0);	
    box (100, 100, 100);    
    }  

  } 



//// REFACTOR!!!!
void mousePressed ()
  {
  }
  
  

