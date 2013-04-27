class Splash
  {
  PImage bg;
  
  void setup ()
    {
    bg = loadImage("img/splash.jpg");
    }
  
  void draw ()
    {
    image(bg, 0, 0, _width_, _height_);

    fill (255);

    translate (0, 0, 100);

    rotateY (PI/16);

    //text ("cooperative", 100, _height_/2 - 100);
    //text ("versus",      100, _height_/2 + 100);

    text ("click to start",      100, _height_/2 + 100);
    
    textFont (_font_, _font_size_ * 2);
    
    rotateY (-PI/16);
    
    text ("blight", _width_/2, (_height_/2) + (_font_size_/2));
    
    }
  }
