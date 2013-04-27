/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

class Logo
  {
  void setup ()
    {
    
    }
    
  void draw (int timer, int whites, int blacks)
    {
      
     //println ("drawing!");
     fill (0);
     
     textFont (_bold_, 60);
     text ("BLACK", 10, 55);
     text ( timer, 10, _game_.height - 10  );
     textFont (_bold_, 24);
     text (blacks + " cells", 191, 31);
     text ( _game_.blackBattles +  " battles", 191, 55);
     

     fill (255);
     scale (-1  , 1);
     textFont (_bold_, 57);
     text ("LIGHT", -_game_.width + 12, 55);
     text ( timer, -_game_.width + 12, _game_.height - 10  );
     textFont (_bold_, 24);
     text (whites + " cells",  -_game_.width + 175, 31);
     text ( _game_.lightBattles + " battles",  -_game_.width + 175, 55);
     scale (-1, 1);
     

    }
  }
