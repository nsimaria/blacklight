/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

class Winner
  {
  int team = -1;
  int countdown = 1000;
  void setup (int team)
    {
    this.team = team;
    }
    
  void draw ()
    {
    String message = "";
    switch (this.team)
      {
      case 0: fill (255); background (0); message = "Black wins. All hail the blacklord."; break;
      case 1: fill (0); background (255); message = "White wins. The light shines in our path."; break;
      }

    
    this.countdown--;
    

    textFont (_bold_, 40);
    text (message, 50, _game_.height / 2 + 50);
    text ("next battle in " + this.countdown + " time units.", 50, _game_.height / 2 + 100);

    scale (-1, 1);
    text (message, -_game_.width + 50, _game_.height / 2 - 100);
    text ("next battle in " + this.countdown + " time units.", -_game_.width + 50, _game_.height / 2 -50);
    scale (-1, 1);

    if (this.countdown == 0)
      _game_.reset ();
    
    }
  }
