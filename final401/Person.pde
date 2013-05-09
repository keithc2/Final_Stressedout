public class Person{
  //pendulum arms and legs
  float t = 0;
  float u = 1.0/120.0;
  float pi = 3.14;
  float angle_arm1;
  float angle_arm2;
  float angle_f_arm1;
  float angle_f_arm2;
  float sholder;
  float head;
  float angle_leg1;
  float angle_leg2;
  float angle_shin1; 
  float angle_shin2;
  float period1;
  float period2;
  //head
  float pos_X1;
  float pos_Y1;
  //neck
  float neck_X1;
  float neck_X2;
  float neck_Y1;
  float neck_Y2;
  //body
  float body_X1;
  float body_Y1;
  float body_X2;
  float body_Y2;
  //arm general
  float arm_length = 40;
  float f_arm_length = 10;
  //right arm
  float arm1_X1;
  float arm1_X2;
  float arm1_Y1;
  float arm1_Y2;
  //right forearm
  float f_arm1_X1;
  float f_arm1_X2;
  float f_arm1_Y1;
  float f_arm1_Y2;
  //left arm
  float arm2_X1;
  float arm2_X2;
  float arm2_Y1;
  float arm2_Y2;
  //left forearm
  float f_arm2_X1;
  float f_arm2_X2;
  float f_arm2_Y1;
  float f_arm2_Y2;
  //right leg
  float leg1_X1;
  float leg1_X2;
  float leg1_Y1;
  float leg1_Y2;
  //right shin
  float shin1_X1;
  float shin1_X2;
  float shin1_Y1;
  float shin1_Y2;
  //left leg
  float leg2_X1;
  float leg2_X2;
  float leg2_Y1;
  float leg2_Y2; 
  //right shin
  float shin2_X1;
  float shin2_X2;
  float shin2_Y1;
  float shin2_Y2;
  boolean start = true;
  float hit = 0;
  
  
  Person(){
    float s;
  }
  
  void update(float s){
//    if(start == false)
//    {
//      hit = hit + u;
//      if(period1*hit >= 1){
//        period1 = s;
//        hit = 0;
//      }
//    } else {
//      period1 = s;
//      start = false;
//    }
    period1 = 5;
    period2 = period1*2;
    t = t + u;
    angle_arm1 = -pi/24 + pi/4 * sin(period1*pi*t);
    angle_arm2 = -pi/24 + pi/4 * -sin(period1*pi*(t));
    angle_leg1 = pi/8 + pi/3 * sin(period1*pi*t);
    angle_leg2 = pi/8 + pi/3 * -sin(period1*pi*(t));
    angle_shin1 = (pi/3-pi/9)*sin(period1*pi*(t));
    angle_shin2 = (pi/3-pi/9)*-sin(period1*pi*(t));
    sholder = pi/6*sin(period1*pi*t);
    head = pi/2*sin(period2*pi*t);
    
    // head position
    pos_X1 = 450 - s*10;
    pos_Y1 = 200 + 5*sin(head);
    //neck position
    neck_X1 = pos_X1;
    neck_X2 = pos_X1 - 1;
    neck_Y1 = pos_Y1+20;
    neck_Y2 = neck_Y1 + 10;
    //body position
    body_X1 = neck_X2;
    body_X2 = neck_X2-s*5;
    body_Y1 = neck_Y2;
    body_Y2 = neck_Y2 + 100;
    //right arm
    arm1_X1 = neck_X2 + 10*sin(sholder);
    arm1_Y1 = neck_Y2;
    arm1_X2 = neck_X2 + arm_length*sin(angle_arm1);
    arm1_Y2 = neck_Y2 + sqrt(arm_length*arm_length - arm_length*sin(angle_arm1)*arm_length*sin(angle_arm1));
    //right forearm
    f_arm1_X1 = arm1_X2;
    f_arm1_Y1 = arm1_Y2;
    //f_arm1_X2 = f_arm1_X1 + f_arm_length*sin(angle_f_arm1 + angle_arm1) + 30;
    //f_arm1_Y2 = f_arm1_Y1 + sqrt(f_arm_length*f_arm_length - f_arm_length*sin(angle_f_arm1+ angle_arm1)*f_arm_length*sin(angle_f_arm1 + angle_arm1))- 20;
    f_arm1_X2 = arm1_X2 + 20;
    f_arm1_Y2 = arm1_Y2 -20;
    //left arm
    arm2_X1 = neck_X2 - 5*sin(sholder);
    arm2_Y1 = neck_Y2;
    arm2_X2 = neck_X2 + arm_length*sin(angle_arm2);
    arm2_Y2 = neck_Y2 + sqrt(arm_length*arm_length - arm_length*sin(angle_arm2)*arm_length*sin(angle_arm2)); 
    //left forearm
    f_arm2_X1 = arm2_X2;
    f_arm2_Y1 = arm2_Y2;
    //f_arm2_X2 = f_arm2_X1 + f_arm_length*sin(angle_f_arm2 + angle_arm2) + 30;
    //f_arm2_Y2 = f_arm2_Y1 + sqrt(f_arm_length*f_arm_length - f_arm_length*sin(angle_f_arm2+ angle_arm2)*f_arm_length*sin(angle_f_arm2 + angle_arm2))- 20;
    f_arm2_X2 = f_arm2_X1 + 20;
    f_arm2_Y2 = f_arm2_Y1 - 20;  
    //right leg
    leg1_X1 = body_X2 + 10*sin(sholder);
    leg1_Y1 = body_Y2;
    leg1_X2 = leg1_X1 + 50*sin(angle_leg1);
    leg1_Y2 = leg1_Y1 + sqrt(50*50 - 50*sin(angle_leg1)*50*sin(angle_leg1));
    
    
    //right shin
    shin1_X1 = leg1_X2;
    shin1_Y1 = leg1_Y2;
    shin1_X2 = shin1_X1 + 50*sin(angle_shin1);
    shin1_Y2 = shin1_Y1 + sqrt(50*50-50*sin(angle_shin2)*50*sin(angle_shin2));
    
    //left leg
    leg2_X1 = body_X2 + 5*sin(sholder);
    leg2_Y1 = body_Y2;
    leg2_X2 = leg1_X1 + 50*sin(angle_leg2);
    leg2_Y2 = leg1_Y1 + sqrt(50*50 - 50*sin(angle_leg2)*50*sin(angle_leg2));
    
    //left shin
    shin2_X1 = leg2_X2;
    shin2_Y1 = leg2_Y2;
    shin2_X2 = shin2_X1 + 50*sin(angle_shin2);
    shin2_Y2 = shin2_Y1 + sqrt(50*50-50*sin(angle_shin2)*50*sin(angle_shin2));
    
    strokeWeight(10);
    ellipse(pos_X1,pos_Y1,40,40);
    line(neck_X1,neck_Y1,neck_X2,neck_Y2);
    line(body_X1,body_Y1,body_X2,body_Y2);
    line(arm1_X1,arm1_Y1,arm1_X2,arm1_Y2);
    line(arm2_X1,arm2_Y1,arm2_X2,arm2_Y2);
    line(f_arm1_X1,f_arm1_Y1,f_arm1_X2,f_arm1_Y2);
    line(f_arm2_X1,f_arm2_Y1,f_arm2_X2,f_arm2_Y2);
    line(leg1_X1,leg1_Y1,leg1_X2,leg1_Y2);
    line(shin1_X1,shin1_Y1,shin1_X2,shin1_Y2);
    line(leg2_X1,leg2_Y1,leg2_X2,leg2_Y2);
    line(shin2_X1,shin2_Y1,shin2_X2,shin2_Y2);
    
  }
}
