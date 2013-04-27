class Blight
  {
  XMLElement[] levels;
  Splash splash;
  Level current;
  Detector detector;
   
  Blight (XMLElement xml)
    {
    levels = xml.getChildren();
    this.hello ();
    this.splash ();
    current = null;
    detector = new Detector ();
    }
  
  
  void hello ()
    {
    println ("Hi. I'm a Blight game.");
    println ("I'm made out of these levels:");

    for (int i = 0; i < levels.length; i++)
      {
      XMLElement level = levels [i];
      println (level.getChild ("name").getContent ());
      }      
    }
  

  void splash ()
    {
    splash = new Splash ();
    splash.setup ();
    }




  void level (int index)
    {
    splash = null;
    current = new Level (levels [index]);
    current.setup ();

    loop ();
    }
  
  void draw ()
    {
    background (0);
    
    
    
    if (splash != null)
      splash.draw ();

    detector.draw ();

    if (current != null)
      current.draw ();


    }
  }
