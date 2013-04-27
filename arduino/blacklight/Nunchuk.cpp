/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin

Nunchuk code based on Maik Schmidt examples from the book Arduino, a Quick Start Guide
*/

#include <Wire.h>
#include <WProgram.h>
#include "Nunchuk.h"

#define NUNCHUK_DEVICE_ID 0x52

void Nunchuk::initialize ()
  {
  Wire.begin ();
  Wire.beginTransmission (NUNCHUK_DEVICE_ID);
  Wire.send (0x40);
  Wire.send (0x00);
  Wire.endTransmission ();
  update ();
  }
  
bool Nunchuk::update ()
  {
  delay (1);
  Wire.requestFrom (NUNCHUK_DEVICE_ID, NUNCHUK_BUFFER_SIZE);
  int byte_counter = 0;
  while (Wire.available() && byte_counter < NUNCHUK_BUFFER_SIZE)
    _buffer[byte_counter++] = decode_byte(Wire.receive ());
  request_data();
  return byte_counter == NUNCHUK_BUFFER_SIZE;
  }
  
void Nunchuk::request_data ()
  {
  Wire.beginTransmission (NUNCHUK_DEVICE_ID);
  Wire.send (0x00);
  Wire.endTransmission ();
  }
  
char Nunchuk::decode_byte(const char b)
  {
  return (b ^ 0x17) + 0x17;
  }
