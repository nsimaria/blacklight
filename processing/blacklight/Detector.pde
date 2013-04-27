/*
BLACKLIGHT v1.0
 Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.
 
 Author: Nuno Simaria - nsimaria@ua.pt - #23652
 Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
 */

import codeanticode.gsvideo.*;

class Detector
{
  GSCapture cam = null;  
  int width  = 320;
  int height = 240;
  int total_pixels = 0;
  int sample_width = 10;
  int sample_height = 10;

  void setup ()
  {
    println ("camera!!");
    this.cam = new GSCapture(_root_, this.width, this.height, "/dev/video0");
//    this.cam = new GSCapture(_root_, this.width, this.height, "/dev/video1");
    this.cam.start ();
    this.total_pixels = this.width * this.height;
  }

  int[] image ()
  {
    
  
  return this.cam.pixels;
  }

  void draw ()
  {

  }
  

}


public void captureEvent(GSCapture c) {
  
  c.read();
}




