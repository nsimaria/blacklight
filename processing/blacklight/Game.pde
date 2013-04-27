/*
BLACKLIGHT v1.0
 Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.
 
 Author: Nuno Simaria - nsimaria@ua.pt - #23652
 Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
 */

class Game
{
  XML xml;
  int width;
  int height;
  int background;
  int fill;
  Input[] inputs = {
  };
  Level[] levels = {
  };
  Level current = null;
  Intro intro = null;
  Logo logo = null;
  Winner winner = null;
  
  //  SoundCipher ost = null;
  AudioPlayer ost = null;
  AudioPlayer soundtrack = null;
  AudioPlayer blackwins = null;
  AudioPlayer lightwins = null;
  Serial leds = null;

  int blackBattles = 0;
  int lightBattles = 0;


  PImage bgimage = null;

  void setup ()
  {
    this.xml = loadXML("xml/config.xml");
    this.loadXml (this.xml);
    //    size (this.width, this.height);

    background (this.background);
    fill (this.fill);
    noStroke ();

    String [] ports = Serial.list ();

    println ("going for ports: " + ports.length);

    /* Nunchuk on */
    for (int i = 0; i < ports.length; i++)
    {

      println ("ports found: " + ports [i]);
    }
    /* Nunchuk off */

    Input input = new Input ();
    input.setup ("/dev/ttyACM0");
    this.inputs = (Input []) append (this.inputs, input);  

    //    this.leds = new Serial(_root_, ports [1], 9600);  
    this.leds = new Serial(_root_, "/dev/ttyACM1", 9600);  

    /*    
     Input input = new Input ();
     if (ports.length > 0)
     {
     input.setup (ports [0]);
     }
     else
     {
     input.setup ("/dev/ttyACM0");
     }
     
     this.inputs = (Input []) append (this.inputs, input);  
     
     if (ports.length > 1)
     {
     this.leds = new Serial(_root_, ports [1], 9600);  
     this.leds = new Serial(_root_, "/dev/ttyACM0", 9600);  
     }*/
    this.reset ();


    //    this.current = this.levels [0];
    //    this.current.setup ();
    //    this.current.game = this;
    //    this.current.setup ();
    //this.bgimage = loadImage("images/egypt.png");
  }
  void reset ()
  {
//    this.intro = new Intro ();
//    this.playIntro ();

  this.begin ();
  }   

  void begin ()
  {
    this.intro = null;
    this.winner = null;
    this.logo = new Logo ();
    this.logo.setup ();


    Level level = new Level ();
    level.name = this.levels [0].name;
    level.width = this.levels [0].width;
    level.height = this.levels [0].height;

    this.current = level;
    this.current.game = this;
    this.current.setup ();

    this.playSoundtrack ();
  }

  void draw ()
  {
    if (this.intro != null)
    {
      this.intro.draw ();
      return;
    }  

    background (this.background);


    if (this.winner != null)
      this.winner.draw ();

    //image(this.bgimage, 0, 0);      

    for (int i = 0; i < this.inputs.length; i++)
      this.inputs [i].draw ();

    if (this.current != null)
      this.current.draw ();

    if (this.logo != null)
    {
      if (this.current != null)
        this.logo.draw (this.current.timer, this.current.battlefield.whites, this.current.battlefield.blacks);
      //else if (this.winner != null)
      //this.logo.draw ((this.winner.team == 0) ? 0 : 255, 0, 0);
    }
  }

  void loadXml (XML node)
  {
    println ("Loading Game XML..."); 
    this.width      = int (node.getChild ("screen/width").getContent ());
    this.height     = int (node.getChild ("screen/height").getContent ());
    this.background = unhex (node.getChild ("screen/background").getContent ());
    this.fill       = unhex (node.getChild ("screen/fill").getContent ());

    XML levels_xml = node.getChild ("levels");

    for (int i = 0; i < levels_xml.getChildCount (); i++)
    {
      XML level_xml = levels_xml.getChild (i);

      Level level = new Level ();
      level.game = this;
      level.loadXml (level_xml); 
      this.levels = (Level [])append (this.levels, level);
    }

    println ("Game XML loaded.");
  }    

  void stopIntro ()
    {
    if ((this.ost != null) && (this.ost.isPlaying ()))
      this.ost.pause ();
    }

  void stopBlackWins ()
    {
    if ((this.blackwins != null) && (this.blackwins.isPlaying ()))
      this.blackwins.pause ();
    }

  void stopLightWins ()
    {
    if ((this.lightwins != null) && (this.lightwins.isPlaying ()))
      this.lightwins.pause ();
    }

  void stopSoundtrack ()
    {
    if ((this.soundtrack != null) && (this.soundtrack.isPlaying ()))
      this.soundtrack.pause ();
    }

  void playSoundtrack ()
  {
      this.stopIntro ();
      this.stopBlackWins ();
      this.stopLightWins ();
    if (this.soundtrack != null)
      {
      if (this.soundtrack.isPlaying ())
        return;
      
      
      this.soundtrack.loop ();
      }
    else
      {
      this.soundtrack = _minim_.loadFile ("ost4real.wav");
      this.soundtrack.loop ();
      }
  }

  void playBlackWins ()
  {
      this.stopSoundtrack ();
      this.stopIntro ();
      this.stopLightWins ();

    if (this.blackwins != null)
      {
      if (this.blackwins.isPlaying ())
        return;


        
      this.blackwins.play (0);
      }
    else
      {
      this.blackwins = _minim_.loadFile ("blackwins.wav");
      this.blackwins.play ();
        
      }
  }



  void playLightWins ()
  {
    this.stopSoundtrack ();
    this.stopIntro ();
    this.stopBlackWins ();

    if (this.lightwins != null)
      {
      if (this.lightwins.isPlaying ())
        return;

        
      this.lightwins.play (0);
      }
    else
      {
      this.lightwins = _minim_.loadFile ("lightwins.wav");
      this.lightwins.play ();
        
      }
  }


  void playIntro ()
  {
    this.stopSoundtrack ();
    this.stopLightWins ();
    this.stopBlackWins ();

    if (this.ost != null)
      {
      if (this.ost.isPlaying ())
        return;

      this.ost.play (0);
      }
    else
      {
      this.ost = _minim_.loadFile ("intro.wav");
      this.ost.play ();
        
      }
  }




  void blackWins ()
  {
    if (this.soundtrack != null)
     {
     this.soundtrack.pause ();
     }
     this.current = null;
     this.blackBattles ++;
     this.winner = new Winner ();
     this.winner.setup (0);
     this.playBlackWins ();
    
    /*
    if (this.ost != null)
     {
     this.ost.destroy ();
     this.ost.stop ();
     }
     println ("The new black.");
     this.current = null;
     this.blackBattles ++;
     this.winner = new Winner ();
     this.winner.setup (0);
     this.playBlackWins ();
     */
  }

  void lightWins ()
  {
    if (this.soundtrack != null)
     {
     this.soundtrack.pause ();
     }
     this.current = null;
     this.lightBattles ++;
     this.winner = new Winner ();
     this.winner.setup (1);
     this.playLightWins ();
    /*
    if (this.ost != null)
     {
     this.ost.destroy ();
     this.ost.stop ();
     }
     println ("Whitey.");
     */
  }

  void score (int power, int side)
  {
    switch (side)
    {
    case 0: 
      fill (0, 120); 
      stroke (100, 180); 
      break;
    case 1: 
      fill (255, 120); 
      stroke (155, 180); 
      break;
    }
    rectMode (CORNER);  

    int cursorX = 10;
    for (int i = 0; i < power; i++)
    {
      rect (cursorX, 60, (i + 1) * 15, 10);
      scale (-1, 1);
      rect ( -_game_.width + cursorX, 60, (i + 1) * 15, 10);
      scale (-1, 1);
      cursorX += (i + 1) * 15 + 7;
    }
  }
}

