class Cell {

  // Form
  int posX = 0;
  int posY = 0;
  int area = 0;

  int animX = 0;

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
  void setup ( int lifeBar, Boolean animating ) {
    this.lifeBar = lifeBar;
    this.animating = animating;

    // Don't let lifebar escalate
    if (this.lifeBar >= 255) this.lifeBar = 255; 
    if (this.lifeBar <= 0) this.lifeBar = 0; 

    stroke (159, 182, 205);
    strokeWeight (2);

    // paints cell according to side
    switch(side) {
    case 2: 
      fill(127); 
      break;
    case 0: 
      fill(255); 
      break;
    case 1: 
      fill(0); 
      break;
    }
  };



  void draw() {
    // debug for cell
    //textFont (_regular_, 48);
    //text ( this.num , posX, posY );

    // if is not between animation draw cell and circle color
    if ( this.animating == false ) {
      quad(
      this.posX, 
      this.posY, 

      this.posX + area, 
      this.posY, 

      this.posX + area, 
      this.posY + area, 

      this.posX, 
      this.posY + area);
      if ( this.side == 1) {
        fill(255);
      }

      fill(lifeBar) ;
      noStroke();
      arc(this.posX + 40, this.posY + 40, 30, 30, 0, 360);
    }


    // if white conquers plays animate white
    if (this.lifeBar >= 255 && this.side != 0) {
      this.lifeBar = 255;
      animateCell(255, 0);
    }

    // if black conquers plays animate black
    if (this.lifeBar <= 0 && this.side != 1) {
      this.lifeBar = 0;
      animateCell(0, 1);
    }
  };

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
    println(lifeBar);
  };

  void updateBlack() {
    println("updateBlack");
    this.lifeBar -= 5;
    println(lifeBar);
  }

  /**************************************************
   *
   * Animates current cell
   *
   ***************************************************/
  void animateCell( int clr, int side ) {
    this.animating = true;
    if (  animX <= this.area) {
      if ( animX > area /2 ) {
        fill(clr);        
        print("animX " + animX);
      }
      else {
        fill(127);
      }
      quad(
      this.posX+animX, 
      this.posY, 

      (this.posX + area) - animX, 
      this.posY, 

      (this.posX + area) -animX, 
      this.posY + area, 

      this.posX + animX, 
      this.posY + area);
    }
    else {
      this.animating = false;
      this.side = side;
      animX = 0;
    }
    animX +=3*0.7;
  };
}

