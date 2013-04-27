/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin

Nunchuk code based on Maik Schmidt examples from the book Arduino, a Quick Start Guide
*/

#ifndef __NUNCHUK_H__
#define __NUNCHUK_H__

#define NUNCHUK_BUFFER_SIZE 6

class Nunchuk
  {
  public :
    void initialize ();
    bool update ();
    
    int joystick_x () const {return _buffer [0];}
    int joystick_y () const {return _buffer [1];}
    
    int x_acceleration () const 
      {
      return ((int) (_buffer [2]) << 2) | ((_buffer [5] >> 2) & 0x03);
      }

    int y_acceleration () const 
      {
      return ((int) (_buffer [3]) << 2) | ((_buffer [5] >> 4) & 0x03);
      }

    int z_acceleration () const 
      {
      return ((int) (_buffer [4]) << 2) | ((_buffer [5] >> 6) & 0x03);
      }

    bool z_button () const { return !(_buffer [5] & 0x01); }
    bool c_button () const { return !(_buffer [5] & 0x02); }

    private:
      void request_data ();
      char decode_byte (const char);
      
      unsigned char _buffer [NUNCHUK_BUFFER_SIZE];

  };
  
#endif
