class Talk{
  
  float t = 0;
  float u = .1;
  float stress;
  float prob;
  String s = "     ";
  Talk(){
    
  }
  
  
  String say(float _stress){
    stress = _stress;
    t = t + u;
    if(t >= 10){
      prob = random(0,10);
      t = 0;
      if(stress > 7.5){
        if(prob >= 9){
          s = "I'm going to flunck out,\n and have no future";
        } else if( prob >7 && prob < 9){
          s = "I'm going to Fail!";
        } else if(prob <= 7 && prob >= 3){
          s = "I too stressed out";
        } else if(prob < 3 && prob >= 2) {
          s = "I'm not going to make it";
        } else{
          s = "Things will get better, RIGHT?";
        }
      } else if(stress >= 4 && stress <= 7.5)
        {
          if(prob >= 8){
           s = "I hope all goes well";
          } else if (prob < 8 && prob >= 5){
           s = "I think things will be alright";
          } else if (prob < 5 && prob >= 2){
           s = "Hold it together,\n you can do this";
          } else { 
            s = "Hang in there";
          }
        } else if(stress < 4)
          { if(prob >= 8){
            s = "I GOT THIS!";
          } else if (prob <8 && prob > 6){
            s = "I'm kicking this semesters butt!";
          } else if (prob <= 6 && prob >= 4){
            s = "WINNING!";
          } else if (prob < 4 && prob >= 2){
            s = " This semester was about kicking butt \n and chewing bubble gum\n and I'm all out of bubble gum";
          } else {
            s = "BEAR DOWN!";
          }
        }
      } else{
      if(t > 7 && t < 10){
        s = "    ";
      }
    }
    return(s);
  
  }
}
