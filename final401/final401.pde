import java.util.*;
import oscP5.*;
import netP5.*;


//Osc Part
OscP5 oscP5;
NetAddress sendTo;
String message = " ";

//Person Stuff
Person person;
Bolder bolder;
Ground ground;
Talk talk;
StressCalc stressCalc;
float value = 50;
float stress;
String said;
float stresser = 5;
float u = 1.0/120.0;
float t = 0;
float t2 = 0;
float u2 = 1.0/60.0;

void setup() {
  size(640, 480);
  
  oscP5 = new OscP5(this, 57121);
  sendTo = new NetAddress("127.0.0.1", 57120);
  
  person = new Person();
  bolder = new Bolder();
  ground = new Ground();//
  stressCalc = new StressCalc();
  talk = new Talk();
  frameRate(60);
}

void draw() {
  t = t + u;
  stress = value/10;
  background(255);
  fill(255);
  if(t >= 1){
    stresser = random(0,15);
    t = 0;
  }
  person.update(stress);
  bolder.update(stress);
  ground.update();
//  println(stress);
  said = talk.say(stress);
  fill(0);
  textSize(24);
  text(said, 250, 50);
  t2 = t2 + u2;
  if(t2 > 5){
    OscMessage myMessage = new OscMessage("/test");
  
    myMessage.add(said);
  
    oscP5.send(myMessage, sendTo);
    t2 = 0;
  }
}

void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/test") == true) {
    if(theOscMessage.checkTypetag("sf")){
      message = theOscMessage.get(0).stringValue();
      value = theOscMessage.get(1).floatValue();
      println(message+", "+value);
      return;
      
    }
  }
}
