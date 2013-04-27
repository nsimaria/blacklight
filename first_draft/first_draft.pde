import processing.opengl.*;
import JMyron.*;

Blight _blight_;
XMLElement config, levels;

int _width_  = 0;
int _height_ = 0;

PFont _font_;
int _font_size_;











void config ()
  {
  _width_  = int (config.getChild ("screen/width").getContent ());
  _height_ = int (config.getChild ("screen/height").getContent ());

  _font_      = loadFont (config.getChild ("font/name").getContent ());
  _font_size_ = int (config.getChild ("font/size").getContent ());
  
  textFont (_font_, _font_size_);
  
  
  size (_width_, _height_, OPENGL);
  }










void mousePressed ()
  {
  _blight_.level (0);
  }







void setup ()
  {
  config = new XMLElement(this, "xml/config.xml");
  levels = new XMLElement(this, "xml/levels.xml");

  config ();

  _blight_ = new Blight (levels);
  }
  
  
  
  
void draw ()
  {
  _blight_.draw ();
  }



