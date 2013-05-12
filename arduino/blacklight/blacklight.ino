/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin

Nunchuk code based on Maik Schmidt examples from the book Arduino, a Quick Start Guide
*/

#include <Wire.h>
#include "Nunchuk.h"

Nunchuk nunchuk;



void setup ()
  {
  Serial.begin (19200);
  delay (100);
  nunchuk.initialize ();
  }
  
void loop ()
  {
    if (nunchuk.update ())
    {
    Serial.print ("NK2");
    Serial.print (" "); 

    Serial.print (nunchuk.joystick_x ());
    Serial.print (" "); 

    Serial.print (nunchuk.joystick_y ());
    Serial.print (" "); 

    Serial.print (nunchuk.x_acceleration ());
    Serial.print (" "); 

    Serial.print (nunchuk.y_acceleration ());
    Serial.print (" "); 

    Serial.print (nunchuk.z_acceleration ());
    Serial.print (" "); 
    
    Serial.print (nunchuk.z_button ());
    Serial.print (" "); 

    Serial.print (nunchuk.c_button ());
    Serial.println (""); 
    }  
  }
