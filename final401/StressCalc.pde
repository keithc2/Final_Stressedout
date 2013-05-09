public class StressCalc{
  
  
  float stress;
  float t = 0;
  float u = 1.0/15.0;
  
  
  StressCalc(){
    
  }
  
  
  float stress(float stresser, float stressed){
    t = t + u;
    stress = stressed;
    if(t >= 1){
      if(stresser > 10 && stress < 10){
        stress = stress + .1;
      } else { 
        if(stresser <=10 && stresser >=5)
        {
        stress = stress;
        } else { 
          if(stresser < 5 && stress > 1)
         {
          stress = stress - .1;
         }
        }
      }
      t = 0;
    }
   return(stress); 
  }
}
