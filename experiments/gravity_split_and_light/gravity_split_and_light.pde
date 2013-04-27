import processing.opengl.*;


//stage size
int WIDTH  = 1200;
int HEIGHT = 800;


// starting elements
int POPULATION = 50;


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
int SPHERE_STARTZ = -10000;

int GRAVITYX = 0;
int GRAVITYY = 5;
int GRAVITYZ = 0;

int SPEED = 20;
int BOUNCEX_SPEED = 20;
int BOUNCEX_DISPLACEMENT = 20;

// vars
Universe universe;
boolean GAMEOVER = false;


import JMyron.*;

JMyron m;//a camera object

//int WIDTH = ;
//int HEIGHT = 600;

//void setup() {
//  size(640, 480, P3D);

  
//   println("Myron " + m.version());
//   rectMode(CENTER);
//   noStroke();
//}


// init configuration
void config ()
  {
  size (WIDTH, HEIGHT, OPENGL);  // setting stage size
  background (BGCOLOR);       // setting bg color
  fill (FILLCOLOR);           // setting fill color

  m = new JMyron();//make a new instance of the object
  m.start(640, 480);//start a capture at 320x240
  m.findGlobs(0);//disable the intelligence to speed up frame rate

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

    int vwidth  = 640;
   int vheight = 480;
   background(0);
   m.update();//update the camera view
   int[] img = m.image(); //get the normal image of the camera
   float r,g,b;
   int px=0;
   int py = 0;
   for(int y=0;y<vheight;y+=10){ //loop through all the pixels
     for(int x=0;x<vwidth;x+=10){ //loop through all the pixels
       float av = (red(img[y*vwidth+x])+green(img[y*vwidth+x])+blue(img[y*vwidth+x]))/3.0;

//       if (av< 200)
//         continue;
       r = red(img[y*vwidth+x]);
       g = green(img[y*vwidth+x]);
       b = blue(img[y*vwidth+x]);
   
 //    translate (10, 10, 10);
     stroke(r, g, b);
//     line (px, py, x, y);
     point (x + width/2 - vwidth/2, y + height/2 - vheight/2, (av * 3) -1000);
//     px = x; py = y;
//     sphere(50);
//     translate(- (x + width/2 - vwidth/2), - (y + height/2 - vheight/2), -(av * 3) );
//     translate (-10, -10, -10);
       
   }
   
   
   
   }
    
    
noStroke ();  
  
//  background (BGCOLOR);
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
