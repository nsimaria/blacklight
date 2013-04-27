/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/

import processing.serial.*;


final int INPUT_END = 10;
final int INPUT_SAMPLES = 16;
final int INPUT_RATE = 19200;

Input [] _inputs_ = {};

class Input
  {  
  Serial port   = null;
  Buffer buffer = null;
  String name   = null;
  
  int jX = 0;
  int jY = 0;  
  int aX = 0;
  int aY = 0;
  int aZ = 0;
  int bC = 0;
  int bZ = 0;
  int b1 = 0;
  int b2 = 0;
  int p1 = 0;
  
  
  Input ()
    {
    _inputs_ = (Input []) append (_inputs_, this);
    }
    
  void setup (String portName)
    {
    if ((portName == null) ||(portName == ""))
      {
      println ("No valid port name for this Input. Getting out!");
      return;
      }

    println ("Setting up Input at " + portName);
    this.name = portName;
    this.port = new Serial (_root_, portName, INPUT_RATE);
    this.buffer = new Buffer ();
    this.port.bufferUntil (INPUT_END);
    
    }
    
  void draw ()
    {
      /*
    print ("jX:" + this.jX + ", ");
    print ("jY:" + this.jY + ", ");
    print ("aX:" + this.aX + ", ");
    print ("aY:" + this.aY + ", ");
    print ("aZ:" + this.aZ + ", ");
    print ("bC:" + this.bC + ", ");
    print ("bZ:" + this.bZ + ", ");
    println ("");*/
    }
    
  void setData (String raw)
    {
    if (raw != null)
      {
      final String [] data = split (trim (raw), ' ');
    
    
      if (data[0].equals ("NK1")) // is main input!
        {
        this.jX = int (data [1]);
        this.jY = int (data [2]);
        this.aX = int (data [3]);
        this.aY = int (data [4]);
        this.aZ = int (data [5]);
        this.bZ = int (data [6]);
        this.bC = int (data [7]);
        }
      }
    }
    
  int horizontal()
    {
    if (this.jX == 0)
      return 0;
      
    return (this.jX - 127);
    }

  int vertical()
    {
    if (this.jY == 0)
      return 0;  

    return (125 - this.jY);
    }

  boolean fire ()
    {

//    return ((this.bZ == 1) || (keyPressed && ( keyCode == ENTER )));
    
//   return true;
   return (this.bZ == 1);
    }
    
  boolean bomb ()
    {
    return (this.bC == 1);
    }

      }
  

void serialEvent (Serial port)
  {
//  println ("serial event!");
  for (int i = 0; i < _inputs_.length; i++)
    {
    if (_inputs_ [i].port == port)
      {
      _inputs_ [i].setData (port.readStringUntil (INPUT_END));
      }
    }  
  
  return;
  }

void keyPressed() 
  {
//    println (keyCode) ;
    String data =  "NK1 0 0 0 0 0 0 0";
    
    switch (keyCode)
      {
      case 37: data =  "NK1 -140 0 0 0 0 0 0"; break; //left
      case 38: data =  "NK1 0 240 0 0 0 0 0"; break; //left
      case 39: data =  "NK1 240 0 0 0 0 0 0"; break; //left
      case 40: data =  "NK1 0 -240 0 0 0 0 0"; break; //left
      case 32: data = "NK1 0 0 0 0 0 1 0"; break; //left
      }
    
  
    for (int i = 0; i < _inputs_.length; i++)
    {
      _inputs_ [i].setData (data);
    }  
  
  return;

  }

void keyReleased() 
  {
//    println (keyCode) ;
    String data =  "NK1 0 0 0 0 0 0 0";
  
    for (int i = 0; i < _inputs_.length; i++)
    {
      _inputs_ [i].setData (data);
    }  
  
  return;

  }



/*


final int LINE_FEED = 10;
final int MAX_SAMPLES = 16;

Serial arduinoPort;
SensorDataBuffer sensorData = new SensorDataBuffer (MAX_SAMPLES);

final int WIDTH = 500;
final int HEIGHT = 500;
final int BAUD_RATE = 19200;
final int X_AXIS_MIN = 300;
final int X_AXIS_MAX = 700;
final int Y_AXIS_MIN = 300;
final int Y_AXIS_MAX = 700;
final int Z_AXIS_MIN = 300;
final int Z_AXIS_MAX = 700;

final int MIN_SCALE = 5;
final int MAX_SCALE = 128;

final float MX = 2.0 / (X_AXIS_MAX - X_AXIS_MIN);
final float MY = 2.0 / (Y_AXIS_MAX - Y_AXIS_MIN);
final float MZ = 2.0 / (Z_AXIS_MAX - Z_AXIS_MIN);

final float BX = 1.0 - MX * X_AXIS_MAX;
final float BY = 1.0 - MX * Y_AXIS_MAX;
final float BZ = 1.0 - MX * Z_AXIS_MAX;

int xpos = WIDTH / 2;
int ypos = HEIGHT / 2;
int scale = 90;

float xrotate = 0.0;
float yrotate = 0.0;
float zrotate = 0.0;

void setup ()
  {
  size (WIDTH, HEIGHT, P3D);
  noStroke ();
  colorMode (RGB, 1);
  background (0);
  arduinoPort = new Serial (this, Serial.list () [0], BAUD_RATE);
  arduinoPort.bufferUntil (LINE_FEED);
  }
  
void draw ()
  {
  background (0);
  pushMatrix   ();
  translate (xpos, ypos, -30);
  rotateX (xrotate);
  rotateY (yrotate);
  rotateZ (zrotate);
  scale (scale);
  
  beginShape (QUADS);
  fill (0, 1, 1); vertex (-1,  1,  1);
  fill (1, 1, 1); vertex ( 1,  1,  1);
  fill (1, 0, 1); vertex ( 1, -1,  1);
  fill (0, 0, 1); vertex (-1, -1,  1);

  fill (1, 1, 1); vertex ( 1,  1,  1);
  fill (1, 1, 0); vertex ( 1,  1, -1);
  fill (1, 0, 0); vertex ( 1, -1, -1);
  fill (1, 0, 1); vertex ( 1, -1,  1);

  fill (1, 1, 0); vertex ( 1,  1, -1);
  fill (0, 1, 0); vertex (-1,  1, -1);
  fill (0, 0, 0); vertex (-1, -1, -1);
  fill (1, 0, 0); vertex ( 1, -1, -1);
  
  fill (0, 1, 0); vertex (-1,  1, -1);
  fill (0, 1, 1); vertex (-1,  1,  1);
  fill (0, 0, 1); vertex (-1, -1,  1);
  fill (0, 0, 0); vertex (-1, -1, -1);

  fill (0, 1, 0); vertex (-1,  1, -1);
  fill (1, 1, 0); vertex ( 1,  1, -1);
  fill (1, 1, 1); vertex ( 1,  1,  1);
  fill (0, 1, 1); vertex (-1,  1,  1);

  fill (0, 0, 0); vertex (-1, -1, -1);
  fill (1, 0, 0); vertex ( 1, -1, -1);
  fill (1, 0, 1); vertex ( 1, -1,  1);
  fill (0, 0, 1); vertex (-1, -1,  1);
  
  endShape ();
  popMatrix ();

  }

void serialEvent (Serial port)
  {
  final String arduinoData = port.readStringUntil (LINE_FEED);
  
  if (arduinoData != null)
    {
    final int [] data = int (split (trim (arduinoData), ' '));
    
    if (data.length == 7)
      {
      xpos = int (map (data [0], 0x1e, 0xe1, 0, WIDTH));
      ypos = int (map (data [1], 0x1d, 0xdf, HEIGHT, 0));
      
      if (data [5] == 1) scale ++;
      if (data [6] == 1) scale --;
      if (scale < MIN_SCALE) scale = MIN_SCALE;
      if (scale > MAX_SCALE) scale = MAX_SCALE;
      
      sensorData.addData (data [2], data [3], data [4]);
      
      final float gx = MX * sensorData.getX () + BX;
      final float gy = MY * sensorData.getY () + BY;
      final float gz = MZ * sensorData.getZ () + BZ;
      
      xrotate = atan2 (gx, sqrt (gy * gy + gz * gz));
      yrotate = atan2 (gy, sqrt (gx * gx + gz * gz));
      zrotate = atan2 (sqrt (gx * gx + gy * gy), gz);
      
      }
    }
  }

class SensorDataBuffer 
  {
  private int _maxSamples;
  private int _bufferIndex;
  private int [] _xBuffer;
  private int [] _yBuffer;
  private int [] _zBuffer;
  
  public SensorDataBuffer (final int maxSamples)
    {
    _maxSamples = maxSamples;
    _bufferIndex = 0;
    _xBuffer = new int [_maxSamples];
    _yBuffer = new int [_maxSamples];
    _zBuffer = new int [_maxSamples];
    }
    
  public void addData (final int x, final int y, final int z)
    {
    if (_bufferIndex >= _maxSamples)
      _bufferIndex = 0;
      
    _xBuffer [_bufferIndex] = x;
    _yBuffer [_bufferIndex] = y;
    _zBuffer [_bufferIndex] = z;
    _bufferIndex++;
    }
    
  public int getX ()
    {
    return getAverageValue (_xBuffer);
    }
  public int getY ()
    {
    return getAverageValue (_yBuffer);
    }
  public int getZ ()
    {
    return getAverageValue (_zBuffer);
    }
    
  private int getAverageValue (final int[] buffer)
    {
    int sum = 0;
    for (int i = 0; i < _maxSamples; i++)
      {
      sum += buffer [i];
      }
      
    return (int) (sum / _maxSamples);
    }
    
  
  }
  */  
