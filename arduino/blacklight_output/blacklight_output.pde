/*
BLACKLIGHT v1.0
Project made for Mestrado de Comunicação Multimédia, Ramo Multimédia Interactivo at Departamento de Comunicação e Arte at Universidade de Aveiro.

Author: Nuno Simaria - nsimaria@ua.pt - #23652
Other workgroup members: Ana Filipa Lacerda, Daniela Rei, Renato Costa, Julien Cuenin
*/


int led1 = 3;
int led2 = 5;
int led3 = 6;
int led4 = 9;
int value = 0;
int control1 = 2;
int control2 = 4;
int control3 = 7;
int control4 = 8;
int control5 = 13;

void setup ()
  {
  Serial.begin (9600);
    pinMode (led1, OUTPUT);
    pinMode (led2, OUTPUT);
    pinMode (led3, OUTPUT);
    pinMode (led4, OUTPUT);
    pinMode (control1, OUTPUT);
    pinMode (control2, OUTPUT);
    pinMode (control3, OUTPUT);
    pinMode (control4, OUTPUT);
    pinMode (control5, OUTPUT);
  }
  
void loop ()
  {
  int incoming = Serial.read ();
  
  if (incoming >= 0)
    value = incoming;
  
  analogWrite (led1, value);
  analogWrite (led2, value);
  analogWrite (led3, value);
  analogWrite (led4, value);
  digitalWrite (control1, HIGH);
  digitalWrite (control2, HIGH);
  digitalWrite (control3, HIGH);
  digitalWrite (control4, HIGH);
  digitalWrite (control5, HIGH);

  }
