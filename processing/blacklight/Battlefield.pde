/*
BLACKLIGHT v1.0
 Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.
 
 Author: Nuno Simaria - nsimaria@ua.pt - #23652
 Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
 */

class Battlefield
{
  int videoScale = 64;
  int width;
  int height;

  int blacks = 0;
  int whites = 0;

  int cols, rows;
  Cell[][] cells = {
  };
  Level level = null;

  Battlefield (int w, int h)
  {
    this.width = w;
    this.height = h;

    println ("Battlefield " + this.width + "x" + this.height + " created");
  }

  void setup() {
    cols = width/videoScale;
    rows = height/videoScale;
    drawGrid();
  }

  void draw() {
   // background(159, 182, 205);
   background(100);

    this.blacks = 0;
    this.whites = 0;

    for (int i = 0; i < this.cells.length; i++) { 
      //rows
      for (int j = 0; j < this.cells[i].length; j++) {
        this.cells [i][j].setup ( this.cells[i][j].lifeBar, this.cells[i][j].animating, this.videoScale );
        this.cells [i][j].draw();

        if (this.cells [i][j].isWhite ())
        {
          whites++;
        }
        else if (this.cells [i][j].isBlack ())
        {
          blacks++;
        }
      }
    }
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
}

