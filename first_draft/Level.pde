class Level
  {
  XMLElement data;
  PImage bg;

  String name;
  int time;
  int enemies;
  int squad;
  String image;
  
  Universe universe;
  Timer timer;
  ScoreBoard scoreboard;
  
  Level (XMLElement xml)
    {
    data = xml;
    
    name    = xml.getChild ("name").getContent ();    
    time    = int (xml.getChild ("time").getContent ());    
    enemies = int (xml.getChild ("enemies").getContent ());    
//    squad   = int (xml.getChild ("squad").getContent ());
    squad = 10;
    image   = xml.getChild ("image").getContent ();
    
    universe = new Universe ();
    timer = new Timer ();
    scoreboard = new ScoreBoard (); 
    }
    
  void setup ()
    {
    background (0);
    bg = loadImage(image);
    
    
    for (int i = 0; i < squad; i++)
      {
      universe.create ();
      }
    
//    universe.be ();
    }
    
  void draw ()
    {
    tint(255, 255, 255, 126); 
    image(bg, 0, 0, _width_, _height_);
    universe.draw ();
    }
  }
