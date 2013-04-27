import processing.opengl.*;


//stage size
int WIDTH  = 1200;
int HEIGHT = 1000;


// starting elements
int POPULATION = 10;


// colors
int BGCOLOR   = 0;
int FILLCOLOR = 100;

// origin
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
int GRAVITYY = 5;
int GRAVITYZ = 0;

int SPEED = 20;
int BOUNCEX_SPEED = 20;
int BOUNCEX_DISPLACEMENT = 20;

// vars
Universe universe;
boolean GAMEOVER = false;

// init configuration
void config ()
  {
  size (WIDTH, HEIGHT, P3D);  // setting stage size
  background (BGCOLOR);       // setting bg color
  fill (FILLCOLOR);           // setting fill color
  noStroke ();                // disabling stroke
  }






// initialize Universe
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
  
  
void draw()
  {
//  directionalLight(255, 255, 255, 1, 1, 1);
//  ambientLight(150, 150, 150);
  background (BGCOLOR);
  fill (200);

  translate (ORIGINX, ORIGINY, ORIGINZ);


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
  int overSphere = -1;
  for(int i=0; i < universe.elements.length; i++) {
    int x = int(screenX(universe.elements[i].x, universe.elements[i].y, universe.elements[i].z));
    int y = int(screenY(universe.elements[i].x, universe.elements[i].y, universe.elements[i].z));
    
    float diameter = universe.elements[i].radius / 2;
    
    if (x > mouseX - diameter && x < mouseX+diameter && y > mouseY-diameter && y < mouseY+diameter) {
       overSphere = i;
    }
  }
  if (overSphere >= 0)
    {
    universe.elements [overSphere].split ();
    
    }
  }
