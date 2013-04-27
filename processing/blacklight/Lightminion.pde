/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

import JMyron.*;

class Lightminion
  {
  Lightlord lightlord = null; 
  Detector detector = null;
  ArrayList lighted = null;
  
  void setup ()
    {
    //this.detector = _detector_;
    }
    
  void draw ()
    {
    //int[] img = this.detector.image ();

    int w = _game_.width;//this.lightlord.level.battlefield.width;
    int h = _game_.height;//this.lightlord.level.battlefield.height;
    
    float r, g, b;
    
    this.lighted = new ArrayList ();

   /* for(int y = 0; y < this.detector.height; y += 10)
      { 
      for(int x = 0; x < this.detector.width; x += 10)
        { 
        float av = (red(img[y*this.detector.width+x])+green(img[y*this.detector.width+x])+blue(img[y*this.detector.width+x]))/3.0;
  
        if (av > 200)
          {
          r = red   (img[y * this.detector.width + x]);
          g = green (img[y * this.detector.width + x]);
          b = blue  (img[y * this.detector.width + x]);

          fill (r, g, b, 100);
          noStroke ();
          
          int[] l = new int[2];
          
      
          
          l[0] = int (x * (float (_game_.width) / float(this.detector.width)));
          l[1] = int (y * (float (_game_.height) / float(this.detector.height)));

          
          this.lighted.add (l);
          
         ellipse  (l[0], l[1], 50, 50);

          }     
        }
      }*/
    }
  }
    
/*

   float r,g,b;
   for(int y=0;y<height;y+=1){ //loop through all the pixels
     for(int x=0;x<width;x+=1){ //loop through all the pixels
       float av = (red(img[y*width+x])+green(img[y*width+x])+blue(img[y*width+x]))/3.0;
 
 
       if (av > 200)
         {
         
       r = red(img[y*width+x]);
       g = green(img[y*width+x]);
       b = blue(img[y*width+x]);
   
     
       
     stroke(r, g, b);
     point(x,y,  - 400);
         }     
   /*  if (av < 200)
      {
      
      }   
      else //if (av > 200)
      {
     //fill(av);
//     fill(r, g, b, av/2 + 10);
//     noStroke ();
//     ellipse(x,y, av/8, av/8);
//     translate (x, y, 0);
//     box(10,10,2* av);
//     translate (-x, -y, 0);
   
   
   
     
for (int i = 0; i < w; i++)
      {
      for (int j = 0; j < h; j++)
        {

        for (int raster_y = 0; raster_y < this.detector.sample_height; raster_y++)
          {
          for (int raster_x = 0; raster_x < this.detector.sample_width; raster_x++)
            {
            int sample_x = (i * this.detector.sample_width) + raster_x;              
            int sample_y = (j * this.detector.sample_height) + raster_y;

            float r =  red   (img [int (sample_y * this.lightlord.source_size [0] + sample_x)]);
            float g =  green (img [int (sample_y * this.lightlord.source_size [0] + sample_x)]);
            float b =  blue  (img [int (sample_y * this.lightlord.source_size [0] + sample_x)]);
            
            int average = int ((r + g + b) / 3);
            if (average > 200)
               {
               rect (sample_x, sample_y, 1, 1);
               } 
            //this.lightlord.level.battlefield.cells [i][j].sample (img [int (sample_y * this.lightlord.source_size [0] + sample_x)]);
            
//
            
//            
            //this.lightlord.level.battlefield.cells [i][j].sample (img [int (sample_y * this.lightlord.source_size [0] + sample_x)]);
            }
          }
//          this.cells [i][j].draw ();
        
        }
      }
*/
  
  

