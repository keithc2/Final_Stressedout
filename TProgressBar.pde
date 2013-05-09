public class TProgressBar {
  private int x;   
  private int y;  
  private int maxWidth;
  private int heightProgress;
  private float value;
  private PFont font;
  private color backgroundColor;
  private color progressColor;
  private int sizeFont;
  
  public TProgressBar(int maxWidth,int heightProgress,int x, int y) {
    this.maxWidth = maxWidth;
    this.heightProgress = heightProgress;
    this.x = x;
    this.y = y;
    this.value = x;
    this.backgroundColor = color(182,205,250,120);
    if (x == 10 & y == 100) {
      this.progressColor = color(255, 0, 0);
    }
    if (x == 10 & y == 200) {
      this.progressColor = color(0, 0, 255);
    }
    this.sizeFont=30;
    this.font=createFont("Arial",12,true);
    textFont(this.font);
    textSize(this.sizeFont);
    smooth();
  }
  
  public void setMaxWidth(int maxWidth) {
    this.maxWidth = maxWidth;
  }
  
  public void setHeightProgress(int heightProgress) {
    this.heightProgress = heightProgress;
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public void setBackgroundColor(color backgroundColor) {
    this.backgroundColor = backgroundColor;
  }
  
  public void setProgressColor(color progressColor) {
    this.progressColor = progressColor;
  }
  
  public void setFontSize(int fontSize) {
    this.sizeFont=sizeFont;
  }
  
  public int percentage() {
   return (int) ((this.value * 100)/this.maxWidth); 
  }
  
  public void setValue(float value) {
    if(value <= this.maxWidth) {
        this.value = value;
    }
    else {
      //println("COMPLETE!");
    }
  }
 
  public void draw() {
    pushStyle();
    textSize(this.sizeFont);
    strokeCap(SQUARE);
    stroke(this.backgroundColor);
    strokeWeight(heightProgress);
    line(this.x, this.y, this.x+this.maxWidth, this.y);
    stroke(this.progressColor);
    strokeWeight(heightProgress);
    line(this.x, this.y, this.x+this.value, this.y);
    textAlign(CENTER);
    if (x == 10 & y == 100) {
      fill(0);
      text("Bob The Builder " + percentage() + " %",this.x+this.maxWidth/2, this.y - 30);
    }
    if (x == 10 & y == 200) {
      fill(0);
      text("Your Health " + percentage() + " %",this.x+this.maxWidth/2, this.y - 30);
    }
    popStyle();
  }
}
