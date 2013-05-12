
/*
BLACK/LIGHT

@author Nuno Simaria - nsimaria@gmail.com
@author Dinis Simões - ?
*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import fullscreen.*;
import processing.opengl.*;

Game            _game_;
PApplet         _root_;
SoftFullScreen  _fs_;  
PFont           _bold_;
PFont           _regular_;
Minim           _minim_ = null;

void setup ()
  {
  size (1024, 768, OPENGL);

  _root_ = this;

  println ("the beat starts here.");

  // smooth ();
  // frameRate (30);
  
  // setup fullscreen
  // _fs_ = new SoftFullScreen (this);
  // _fs_.enter ();
  
  // setup sound
  _minim_   = new Minim (this);

  // setup fonts
  _bold_    = loadFont ("Code-Bold-48.vlw");
  _regular_ = loadFont ("Code-Light-48.vlw");

  // setup Game
  _game_ = new Game ();
  _game_.setup ();
  

  //Ess.start (_root_);
  //AudioChannel ost = new AudioChannel ("ost.mp3");
  //  ost.play ();
  
  }
  
void draw ()
  {
  _game_.draw ();
  }
