#include <Servo.h>

const int trig = 2;
const int echo = 3;

Servo myServo;

void setup() {
  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);

  myServo.attach(10);

  Serial.begin(9600);
}

void loop() {

  for (int i = 0; i <= 180; i++) {

    myServo.write(i);
    delay(7);

    int distance = calcDist();

    Serial.print(i);
    Serial.print(",");
    Serial.println(distance);
    delay(7);
  }

  for (int i = 180; i >= 0; i--) {

    myServo.write(i);
    delay(7);

    int distance = calcDist();

    Serial.print(i);
    Serial.print(",");
    Serial.println(distance);

    delay(7);
  }
}

int calcDist() {

  digitalWrite(trig, LOW);
  delayMicroseconds(2);

  digitalWrite(trig, HIGH);
  delayMicroseconds(10);

  digitalWrite(trig, LOW);

  long duration = pulseIn(echo, HIGH);

  int distance = duration * 0.034 / 2;

  return distance;
}