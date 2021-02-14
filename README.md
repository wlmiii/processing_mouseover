# processing_mouseover
Demonstration of intercepting mouse-overs on regions in a Processing sketch to light up LEDs on an Arduino Uno.

This is a PlatformIO project used for demonstrating how to pass data from a Processing sketch via serial interface to an Arduino Uno.

The sketch is basically a small window which contains three small blocks, and turn either red, yellow, or green when the mouse is over them (the left block turns red, the middle block turns yellow, and the right block turns green).

The sketch then sends a signal to the Arduino to turn on the matching-colored LED (whenever the mouse is over a block; all LEDs are off when the mouse is not over any of them).
