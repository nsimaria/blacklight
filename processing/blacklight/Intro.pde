/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

 class Intro
   {
   int currentX = 1280;
     
   void setup ()
     {
     }
     
   void draw ()
     {
     background (0);

     fill (255);
     textFont (_bold_, 48);
     text ("BLACK", (_game_.width/2) - 150, _game_.height / 2);

     scale (-1,1);
     textFont (_regular_, 48);
     text ("Light", -(_game_.width/2) + 10, _game_.height / 2 + 48);
     scale (-1,1);
     
     
     fill (255);
     rect (currentX, 0, _game_.width, _game_.height);
     
     fill (0);
     textFont (_regular_, 48);
     text ("LIGHT", currentX + 10, _game_.height / 2);
     scale (-1,1);
     textFont (_bold_, 48);
     text ("BLACK", -currentX - 145, _game_.height / 2 + 48);
     scale (-1,1);
     
     if (this.currentX > ((_game_.width/2)))
       this.currentX -= 10;
     else
       {
       textFont (_bold_, 24);
       text ("Fire on the black side to start.", _game_.width - 400, _game_.height - 30);
       fill (255);
       scale (-1,1);
       text ("Fire on the black side to start.", -400, _game_.height - 30);
       scale (-1,1);
       if ((_game_.inputs.length) > 0 && (_game_.inputs [0].fire ()))
         {
         _game_.begin ();
         }
       }
       

     }
     
     
   }
