/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

class Lightmatter
  {
  float x = 0;
  float y = 0;

  float width  = 0;
  float height = 0;

  float sampled_r = 0;
  float sampled_g = 0;
  float sampled_b = 0;
  float samples = 0;
  
  Lightmatter (float x, float y, float w, float h)
    {
    this.x = x;
    this.y = y;
    this.width = w;
    this.height = h;
    }
  
  
  void setup ()
    {
    
    }

  void draw ()
    {
    if (this.isLighted ())
      {
      fill (this.amount ());
      ellipse (this.x + (this.width / 2), this.y + (this.height / 2), this.width - 1, this.height - 1);
      }
    else
      {
      fill (255, 10);
      ellipse (this.x + (this.width / 2), this.y + (this.height / 2), this.width - 1, this.height - 1);
      }
    }

  float amount ()
    {
    return ((this.sampled_r/this.samples) + (this.sampled_g/this.samples) + (this.sampled_b/this.samples)) / 3.0;
    }
 
  boolean isLighted ()
    {
    return (this.amount() > 200);
    }
     
  void reset ()
    {
    this.sampled_r = 0;
    this.sampled_g = 0;
    this.sampled_b = 0;
    this.samples   = 0;
    }
  void sample (color c)
    {
    this.sampled_r += red (c);
    this.sampled_g += green (c);
    this.sampled_b += blue (c);
    this.samples++;
    }
  }
