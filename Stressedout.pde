import java.util.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress sendTo;
String typing = "\n";
String saved = "";
PFont f;
TProgressBar prog;
float stress = random(300);
float newperc;
TProgressBar prog2;
float health = 300.0;
float newhealth = 100;
float encourage = random(0, 0.25);
float discourage = random(0.25, 0.75);
String[] Encouragement = {"you are smart", "genious", "you can do it", "you got this", "you are a genious"};
String[] Discouragement = {"you are stupid", "that was horrible", "finals", "pop quiz", "you can't do this"};
String s = "";
float response = random(0.25, 0.3);
int temp = 0;

void setup() {
  size(350,350);
  f = createFont("Arial",16,true);
  oscP5 = new OscP5(this, 57120);
  sendTo = new NetAddress("127.0.0.1", 57121);  
}

void draw() {
  background(255);
  this.prog = new TProgressBar(300,50,10,100);
  this.prog2 = new TProgressBar(300,50,10,200);
  this.prog.setValue(stress);
  this.prog2.setValue(health);
  this.prog.draw();
  this.prog2.draw();
  timer();
  textFont(f);
  fill(0);
  text(typing,2,250);
}

void keyPressed() {
  if (key == ENTER) {
    typing = typing.substring(1, typing.length());
    saved = typing;
    for (int i = 0; i <= Encouragement.length - 1; i++) {
      if (saved.equals(Encouragement[i])) {
        newperc = this.prog.percentage() - (this.prog.percentage() * encourage);
        if (newperc >= 100) {
          newperc = 100;
        }
        if (newperc <= 0) {
          newperc = 0;
        }
        display(newperc, newhealth);
        sender(saved, newperc);
      }
    }
    for (int j = 0; j <= Discouragement.length - 1; j++) {
      if (saved.equals(Discouragement[j])) {
        newperc = this.prog.percentage() + (this.prog.percentage() * discourage);
        newhealth = this.prog2.percentage() + (this.prog2.percentage() * discourage);
        if (newperc >= 100) {
          newperc = 100;
        }
        if (newperc <= 0) {
          newperc = 0;
        }
        if (newhealth >= 100) {
          newhealth = 100;
        }
        display(newperc, newhealth);
        //sender(saved, newperc);
      }
    }
    sender(saved, newperc);
    //OscMessage myMessage = new OscMessage("/test");
    //myMessage.add(saved);
    //myMessage.add(newperc);
    //oscP5.send(myMessage, sendTo);
    typing = "";
  }
  
  if (key == BACKSPACE) {
    typing = typing.substring(0, typing.length() - 1);
  }
  else {
    typing = typing + key;
  }
}

void display(float newperc, float newhealth) {
  this.prog = new TProgressBar(300,50,10,100);
  this.prog2 = new TProgressBar(300,50,10,200);
  stress = (300 * (newperc/100));
  health = (300 * (newhealth/100));
  this.prog.setValue(stress);
  this.prog2.setValue(health);
  this.prog.draw();
  this.prog2.draw();
}

void keyReleased() {
  if (key == ENTER) {
    encourage = random(0, 0.25);
    discourage = random(0.25, 0.75);
    response = random(0.25, 0.3);
  }
}

void timer() {
  temp = frameCount;
  if (temp%300 == 0) {
    temp = 0;
    newperc = this.prog.percentage() + (this.prog.percentage() * 0.05);
    newhealth = this.prog2.percentage() + (this.prog2.percentage() * 0.075);
    if (newperc >= 100) {
      newperc = 100;
    }
    if (newperc <= 21 && temp%300 == 0) {
      newperc = newperc + 1;
    }
    if (newhealth >= 100) {
      newhealth = 100;
    }
    display(newperc, newhealth);
    sender(saved, newperc);
  }
}

void sender(String saved, float newperc) {
    OscMessage myMessage = new OscMessage("/test");
    myMessage.add(saved);
    myMessage.add(newperc);
    oscP5.send(myMessage, sendTo);
}

void healthupdate(String strings) {
  if (strings.equals("I GOT THIS!") | strings.equals("I'm kicking this semesters butt!") | strings.equals("This semester was about kicking butt \n and chewing bubble gum \n and I'm all out of bubble gum") | strings.equals("WINNING!") | strings.equals("BEAR DOWN!")) {
    newhealth = this.prog2.percentage() - (this.prog2.percentage() * response);
    display(newperc, newhealth);
    sender(saved, newperc);
  }
  if (strings.equals("I'm going to flunck out, \n and have no future") | strings.equals("I'm going to Fail!") | strings.equals("I'm too stressed out") | strings.equals("I'm not going to make it") | strings.equals("Things will get better, RIGHT?")) {
    newhealth = this.prog2.percentage() + (this.prog2.percentage() * response);
    display(newperc, newhealth);
    sender(saved, newperc);
  }
}
void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/test") == true) {
    if(theOscMessage.checkTypetag("s")) {
      String strings = theOscMessage.get(0).stringValue();
      println(strings);
      s = strings;
      //println(s);
      healthupdate(s);
      return;
    }
  }
}
