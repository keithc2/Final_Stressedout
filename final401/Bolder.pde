public class Bolder{
  
  float t = 0;
  float u;
  float pi = 3.14;
  float period1;
  float hit = 0;
  boolean start = true;
  
  Bolder(){
    u = 1.0/120.0;
  }
  
  void update(float s){
    t = t - u;
    if(start == false)
    {
      hit = hit + u;
      if(period1/hit >= 1){
        period1 = s;
        hit = 0;
      }
    } else {
      period1 = s;
      start = false;
    }
    ellipse(100,235,400,400);
    ellipse(100+100*sin(period1*pi*t),235+100*cos(period1*pi*t),20,20);
    ellipse(100+50*sin(period1*pi*t + pi/4),235+50*cos(period1*pi*t + pi/4),40,40);
    ellipse(100+150*sin(period1*pi*t + 5*pi/9),235+150*cos(period1*pi*t + 5* pi/9),80,80);
    ellipse(100+150*sin(period1*pi*t - 2*pi/5),235+150*cos(period1*pi*t - 2* pi/5),30,30);
  }
  
}
