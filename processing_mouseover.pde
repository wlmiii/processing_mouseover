//
// Turning an LED on and off; used in tandem with an Arduino sketch,
// which reads a character 'H' to turn the LED on, off otherwise.
//
// Check if the mouse is over a rectangle and write the status to the serial port

import processing.serial.*; 
 
Serial port;                       // Create object from Serial class
int portIndex = -1;
 
void setup() {
  size(500, 200); 
  noStroke(); 
  frameRate(10);
  
  // print the available serial ports to the console
  printArray(Serial.list());
  
  // Set the port commonly configured on Linux, which
  // is typically /dev/ttyACM0.
  // You don't want to perfom I/O on the wrong port!
  for (int i = 0; i < Serial.list().length; i++) {
    String portName = Serial.list()[i];
    
    if (portName.indexOf("/dev/ttyACM", 0) == 0) {
      println("Found Arduino at port " + i + ": " + portName);
      portIndex = i;
    } else {
      println("Arduino not found: port " + i);
    }
  }
  
  // Exit if no valid Arduino serial port found.
  if (portIndex == -1) {
    exit();
  } else {
    // Open the port that the board is connected to and use the same speed (9600 bps)
    port = new Serial(this, Serial.list()[portIndex], 9600);
  }
} 
 
void draw() { 
  background(255); 
  if (mouseOverRedRect() == true)  {
    port.write('R');
    fill(#FF0000);
    rect(50, 50, 100, 100);
    fill(0);
    rect(200, 50, 100, 100);
    rect(350, 50, 100, 100);
  } else
  if (mouseOverYellowRect() == true ){
    port.write('Y');
    fill(#FFFF00);
    rect(200, 50, 100, 100);
    fill(0);
    rect(50, 50, 100, 100);
    rect(350, 50, 100, 100);
  } else
  if (mouseOverGreenRect() == true) {
    port.write('G');
    fill(#00FF00);
    rect(350, 50, 100, 100);
    fill(0);
    rect(50, 50, 100, 100);
    rect(200, 50, 100, 100);
  } else {
    port.write('0');
    fill(0);
    rect(50, 50, 100, 100);
    rect(200, 50, 100, 100);
    rect(350, 50, 100, 100);
  }
} 


boolean mouseOverRedRect() { 
  return ((mouseX >= 50) && (mouseX <= 150) && (mouseY >= 50) && (mouseY <= 150)); 
}
boolean mouseOverYellowRect() { 
  return ((mouseX >= 200) && (mouseX <= 300) && (mouseY >= 50) && (mouseY <= 150)); 
}
boolean mouseOverGreenRect() { 
  return ((mouseX >= 350) && (mouseX <= 450) && (mouseY >= 50) && (mouseY <= 150)); 
}
