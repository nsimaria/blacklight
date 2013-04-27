import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela 
Rei, Renato Costa, Julien Cuenin
*/




//import krister.Ess.*;


import fullscreen.*;
import processing.opengl.*;


Game _game_;
PApplet _root_;
SoftFullScreen _fs_;  
PFont _bold_;
PFont _regular_;
//Detector _detector_ = null;

Minim _minim_ = null;

void setup ()
  {
  size (1024, 768, OPENGL);
  
  _root_ = this;

//  smooth ();
//  frameRate (30);
  
  println ("the beat starts here.");
/*  _fs_ = new SoftFullScreen (this);
  _fs_.enter ();*/

  _minim_ = new Minim (this);
  _bold_    = loadFont ("Code-Bold-48.vlw");
  _regular_ = loadFont ("Code-Light-48.vlw");

  //_detector_ = new Detector ();
  //_detector_.setup ();

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
