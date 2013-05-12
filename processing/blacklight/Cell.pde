/*
BLACKLIGHT v1.0
 Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.
 
 Author: Nuno Simaria - nsimaria@ua.pt - #23652
 Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
 */


class Cell {

  // Form
  int posX = 0;
  int posY = 0;
  int area = 0;

  int animX = 0;
  int animY = 0;
 
 int fillBlack = 0;
 int fillWhite = 255;
 int fillNeutral = 127;
 int opacity = 50;
 
  // Propreties
  int lifeBar = 127;
  Boolean animating = false;
  // 0 -> white 
  // 1 -> black 
  // 2-> null
  int side = 2;

  //Piece is a quad so receives x, y and quad area to deal later
  Cell ( int x, int y, int area) {
    this.posX = x;
    this.posY = y;
    this.area = area;
  }


  /**************************************************
   *
   * Upon creation it recieves the last lifeBar
   * and state from cell in same position
   *
   ***************************************************/
  void setup ( int lifeBar, Boolean animating, int cellArea ) {
    this.lifeBar = lifeBar;
    this.animating = animating;
    this.side = side;

    // Don't let lifebar escalate
    if (this.lifeBar >= 255) this.lifeBar = 255; 
    if (this.lifeBar <= 0) this.lifeBar = 0; 

    stroke (150, this.opacity);
    strokeWeight (2);

    // paints cell according to side
    switch(this.side) {
    case 2: 
      fill( this.fillNeutral, this.opacity ); 
      break;
    case 0: 
      fill( this.fillWhite, this.opacity ); 
      break;
    case 1: 
      fill( this.fillBlack, this.opacity ); 
      break;
    }
  };



  void draw() {

    // if is not between animation draw cell and circle color
    if ( this.animating == false ) {
      if (this.side == 0)
//        fill (this.fillWhite, this.opacity + 70);
        fill (lifeBar, this.opacity + 80);
      else
        fill(lifeBar, this.opacity + 10 ) ;
      
      rect ( posX, posY, area, area );
      
    //  noStroke();
      // arc(this.posX + 40, this.posY + 40, 30, 30, 0, 360);
      //ellipse(this.posX + (this.area / 2 ), this.posY + ( this.area / 2), 30, 30);
    }

    // if white conquers plays animate white
    if (this.isWhite () && (this.side != 0)) {
      this.lifeBar = 255;
      animateCell( this.fillWhite, 0);
    }

    // if black conquers plays animate black
    if (this.isBlack () && (this.side != 1)) {
      this.lifeBar = 0;
      animateCell( this.fillBlack , 1);
    }
  }
  boolean isWhite ()
  {
    return (this.lifeBar >= 255);
  }

  boolean isBlack ()
  {
    return (this.lifeBar <= 0);
  }


  /**************************************************
   *
   * Updates cell conquer power
   *
   ***************************************************/
  void update (int player) {
    if ( this.animating == false ) {
      switch(player) {
      case 0: 
        updateWhite(); 
        break; 
      case 1: 
        updateBlack(); 
        break;
      }
    }
  };

  void updateWhite () {
    this.lifeBar += 5;
    //    println(lifeBar);
  };

  void updateBlack() {
    //    println("updateBlack");
    this.lifeBar -= 5;
    //    println(lifeBar);
  }

  /**************************************************
   *
   * Animates current cell
   *
   ***************************************************/
  void animateCell( int clr, int side ) {
    this.animating = true;
    if (  animX <= this.area) {
      fill(clr, this.opacity );  
      
      //this is a mess got to solve better
     /* if ( animX > area /2 ) {
        fill(clr, this.opacity );        
        //print("animX " + animX);
      } else if ( this.side != 2 ) {
        switch(this.side) {
        case 0: 
        println("fillWhite");
          fill( this.fillWhite, this.opacity );
          break;
        case 1: 
          fill( this.fillBlack, this.opacity ); 
          break;
        }
      } else {
        fill( this.fillNeutral, this.opacity );
      }*/
      
      noStroke();
      rect ( posX + animX, posY, area - animX * 2, area);
      
    } else {
      this.animating = false;
      this.side = side;
      animX = 0;

      // draw last frame animated to prevent blinking
      if ( this.side == 0 ) 
        {
        fill( this.fillWhite, this.opacity + 20 );
        }
      else if ( this.side == 1 )
        {
        fill( this.fillBlack, this.opacity + 20);
        }

      rect ( posX + animX, posY, area - animX * 2, area);
    }
    animX +=5*0.9;
    animY += 5;
  };
  
}
