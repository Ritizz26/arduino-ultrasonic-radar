# Arduino Ultrasonic Radar
A servo-scanned ultrasonic radar system built with an Arduino UNO, HC-SR04 ultrasonic sensor, and Processing. The system measures the distance of objects at different angular positions and visualizes the measurements in real time through a radar-style interface.

## Overview

The HC-SR04 ultrasonic sensor is mounted on a servo motor and rotated through a defined angular range. At each angular position, the Arduino measures the distance to an object and sends the angle and distance through serial communication.

A Processing application receives this data and converts the polar measurements into Cartesian coordinates to display them on a radar-style interface.

The visualization includes a semicircular radar grid, distance rings, angular reference lines, a rotating sweep, and a fading detection effect.

## Features

* Servo-controlled ultrasonic scanning
* HC-SR04 distance measurement
* Real-time angle and distance data
* Arduino-to-Processing serial communication
* Polar-to-Cartesian coordinate transformation
* Dynamic radar sweep
* Distance scaling for screen visualization
* Fading radar persistence effect
* 30° angular reference lines
* Real-time graphical interface

## Hardware

 Component                     Quantity 
 
 Arduino UNO                          1 <br>
 HC-SR04 Ultrasonic Sensor            1 <br>
 Servo Motor                          1 <br>
 Breadboard                           1 <br>
 Jumper Wires               As required<br>
 Computer                             1 <br>

## Circuit Connections

 Component     Arduino Pin 
 
 HC-SR04 Trig  D2          <br>
 HC-SR04 Echo  D3          <br>
 Servo Signal  D10         <br>
 HC-SR04 VCC   5V          <br>
 HC-SR04 GND   GND         <br>
 Servo VCC     5V          <br>
 Servo GND     GND         <br>

## Working Principle

The HC-SR04 determines distance using ultrasonic time-of-flight measurement. The Arduino triggers the sensor and measures the duration of the returning echo.

The distance is determined from the measured travel time:


d = vt/2

where `d` is the distance to the object, `v` is the speed of the ultrasonic wave, and `t` is the round-trip travel time.

The servo provides the angular position of the sensor. Therefore, each measurement can be represented as:
(θ, d)

The Arduino sends the measured values to Processing in the form:
angle,distance
For example:

60,15
represents a measurement taken at 60° with a distance of 15 cm.

## Mathematical Visualization

Because the sensor measurements are obtained as angle and distance, they are naturally represented in polar coordinates.

Processing converts these measurements into Cartesian screen coordinates using:


x = cx + r cos(θ)
y = cy - r sin(θ)

where `cx` and `cy` represent the centre of the radar and `r` represents the scaled distance.

The negative sign in the `y` equation accounts for the coordinate system used by Processing, where the positive vertical direction points downward.

A scaling factor is used to convert physical distance into screen pixels:

r = d × scale

## Software

### Arduino

The Arduino program controls:

* HC-SR04 triggering and echo measurement
* Servo position
* Serial communication
* Angle and distance data transmission

### Processing

The Processing program handles:

* Serial data reception
* Data parsing
* Coordinate transformation
* Radar grid generation
* Sweep animation
* Detection visualization
* Distance and angle labels
* Persistence effect

## What I Learned

This project provided practical experience with:

* Arduino programming
* Ultrasonic sensing
* Servo motor control
* Serial communication
* Data parsing
* Polar and Cartesian coordinate systems
* Real-time graphical programming
* Sensor-data visualization
* Integrating hardware and software into a single system

## Future Improvements

Possible improvements include:

* Independent persistence for detected objects
* Improved detection visualization
* Multiple ultrasonic sensors
* Greater angular resolution
* Automatic object tracking
* Improved filtering of noisy measurements
* A more advanced graphical interface

## Documentation

The complete project documentation, including the theory, circuit design, working procedure, challenges, limitations, and source code, is available in the `RadarDocuments.pdf` file.

## Author

**Ritiz Shrestha**
SERN — Founding Member

