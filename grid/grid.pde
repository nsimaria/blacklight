/**************************************************
 *
 * Size of each cell calculated with a 
 * division of stage's width with a multiple of 8
 *
 * 1024 / 16 = 64
 * 768 / 16 = 43
 * 1280 / 16 = 80
 *
 **************************************************/
int videoScale = 80;
int width = 1280;
int height = 720;

int cols, rows;
Cell[][] cells = {
};

// Players x,y
int mX ;
int mY;

PFont _regular_;

BlackMinion blackminion;

void setup() {
  _regular_ = loadFont ("Code-Bold-48.vlw");
  size(width, height);  

  cols = width/videoScale;
  rows = height/videoScale;

  //noLoop();
  drawGrid();
  
  // Setup blackminion
  blackminion = new BlackMinion();
  blackminion.setup();
}

void draw() {
  background(159, 182, 205);

  for (int i = 0; i < this.cells.length; i++) {
    //rows
    for (int j = 0; j < this.cells[i].length; j++) {
      this.cells [i][j].setup ( this.cells[i][j].lifeBar, this.cells[i][j].animating );
      this.cells [i][j].draw();
    }
  }
  
  moveBlack();
  this.blackminion.draw();
}

/**************************************************
 *
 * Draw grid once
 *
 **************************************************/
void drawGrid () {
  for (int i = 0; i < cols; i++) {
    Cell [] column = new Cell [rows];
    for (int j = 0; j < rows; j++) {

      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;

      Cell cell = new Cell (x, y, videoScale);
      column [j] = cell;
      //cell.setup();
    }
    this.cells = (Cell[][]) append (this.cells, column);
  }
}

/**************************************************
 *
 * Returns cell affected by player
 *
 **************************************************/
Cell getCell (int x, int y)
{
  int cellX = floor (cols * x) / this.width;
  int cellY = floor (rows * y) / this.height;

  //println ("cellX " + cellX + ", cellY " + cellY);
  return this.cells [cellX][cellY];
}


/**************************************************
 *
 * Simulated White Player
 *
 **************************************************/
void mouseMoved() {
  mX = mouseX;
  mY = mouseY;
  Cell cell = this.getCell ( mX, mY);
  cell.update(0);
}


void moveBlack() {
  // Bounce
  if ( blackminion.posX <= 0 )  keyCode = RIGHT;
  if ( blackminion.posX >= 1270 )  keyCode = LEFT;
  if ( blackminion.posY <= 0 )  keyCode = DOWN;
  if ( blackminion.posY >= 710 )  keyCode = UP;


  switch(keyCode) {
  case UP: 
    blackminion.posY -= 5; 
    break;
  case DOWN: 
    blackminion.posY += 5; 
    break;
  case LEFT: 
    blackminion.posX -= 5; 
    break;
  case RIGHT: 
    blackminion.posX += 5; 
    break;
  }

  Cell cell = this.getCell ( blackminion.posX, blackminion.posY);
  cell.update(1);
}
/**************************************************
 *
 * Simulated Black Player
 *
 **************************************************/
class BlackMinion {
  int posX = 0;
  int posY = 0;

  void setup() {
  };

  void draw() {
    display();
  }


  void display() {
    println("posY" + posY);
    fill(0);
    ellipse (posX, posY, 20, 20);
  }
}; 

