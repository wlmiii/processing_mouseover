#include "Arduino.h"

//
// Turning a light on and off; used in tandem with a Processing sketch, which
// sends a character 'H' or an 'L'.

// Read data from the serial and turn ON or OFF a light depending on the value

char led;                          // Data received from the serial port

int redPin = 2;                    // Set the pin for the RED LED to digtial pin 2
int yellowPin = 4;                 // Set the pin for the YELLOW LED to digital pin 4
int greenPin = 6;                  // Set the pin for the GREEN LED to digital pin 6

void setup() {
  pinMode(redPin, OUTPUT);         // Set pin as OUTPUT
  pinMode(yellowPin, OUTPUT);
  pinMode(greenPin, OUTPUT);

  Serial.begin(9600);              // Start serial communication at 9600 bps
}

void loop() {
  if (Serial.available()) {        // If data is available to read,
    led = Serial.read();           // read it and store it in val
  } else {
    led = '0';
  }

  switch (led) {
    case 'R':
      digitalWrite(redPin, HIGH);
      digitalWrite(yellowPin, LOW);
      digitalWrite(greenPin, LOW);
      Serial.println("R");
      break;
    case 'Y':
      digitalWrite(redPin, LOW);
      digitalWrite(yellowPin, HIGH);
      digitalWrite(greenPin, LOW);
      Serial.println("Y");
      break;
    case 'G':
      digitalWrite(redPin, LOW);
      digitalWrite(yellowPin, LOW);
      digitalWrite(greenPin, HIGH);
      Serial.println("G");
      break;
    default:
      digitalWrite(redPin, LOW);
      digitalWrite(yellowPin, LOW);
      digitalWrite(greenPin, LOW);
      Serial.println("0");
  }

  delay(100);
}
