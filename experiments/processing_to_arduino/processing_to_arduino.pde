import processing.serial.*;

Serial port = null;

int value = 0;
int increment = 1;

void setup ()
  {
  String portName = Serial.list()[0];
  port = new Serial(this, portName, 9600);
  }
  
void draw ()
  {
  port.write (value);

  value = value + increment;
  
  if (value >= 255)
    increment = -1;
  if (value <= 0)
    increment = 1;
    
  println (value);
  delay (5);
  }
  
  
