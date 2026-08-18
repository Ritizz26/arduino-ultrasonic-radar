import processing.serial.*;
Serial myport;
int angle=0;
int distance=0;
float maxDis=60;
float scale=5;
float rRad=maxDis*scale;
void setup(){
  size(1000,800);
  smooth();
  println(Serial.list());
 myport = new Serial(this, Serial.list()[0],9600);
 myport.bufferUntil('\n');
}
void draw(){
  fill(0, 10 );
  noStroke();
  rect(0, 0, width, height/2);
  fill(0);
  rect(0,height/2,width,height/2);
  noFill();
  stroke(0,255,0);
  strokeWeight(2);
  float cx=500;
  float cy=400;
  textSize(15);
  
 for (int r=10;r<=maxDis;r+=10){
   float rad=r*scale;
   noFill();
   arc(cx,cy,2*rad,2*rad,PI,TWO_PI);
   fill(0,255,0);
   text(r+"cm",cx+rad-10,cy+20);
   text(r+"cm",cx-rad-10,cy+20);
 }
 
  float x = cx+ distance*scale* cos(radians(angle));
  float y = cy- distance*scale* sin(radians(angle));  
  fill(0,255,0);
  stroke(0,255,0);
  line(0,450,1000,450);
  
 for(int i=0; i<=180;i++){
   if(i%30==0){
    float px=cx+rRad* cos(radians(i));
    float py=cy-rRad* sin(radians(i));
  line(cx,cy, px, py);
  if(i==0){
  textSize(20);
  text(i+ "°" ,px+5,py-4);
  }
  else if(i==150||i==180){
  textSize(20);
  text(i+ "°" ,px-37,py-4);
  }
  else{
  textSize(20);
  text(i+ "°" ,px-10,py-10);
  }
   }
 }
  
  textSize(25);
  text("Angle: "+angle+"°",300,500);
  text("Distance: "+distance+"cm",600,500);
  float swpx= cx+ rRad* cos(radians(angle));
  float swpy= cy- rRad* sin(radians(angle));
  stroke(0,255,0);
  strokeWeight(7);
  line(cx,cy,swpx,swpy);
  if (distance > 0 && distance <= maxDis) {
  float intensity = map(distance, 0, maxDis, 255, 80);

  stroke(255, 0, 0, intensity);
  strokeWeight(7);

  line(cx, cy, x, y);
}
  
}
void serialEvent(Serial myport){
  String data = myport.readStringUntil('\n');
  if(data!=null){
    data = trim(data);
    String[] values=split(data,',');
    angle = int(values[0]);
    distance= int(values[1]);
  }
} 
