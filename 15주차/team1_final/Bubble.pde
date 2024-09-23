public class Spray {
  PImage bubble; 
  float centerX;
  float centerY;
  float bubbleScale;
  float scaleValue;
  public Spray (int x, int y){
    centerX = x;
    centerY = y;
    bubble  = loadImage("bubble.png");
  }
  
  public void draw(float value){
    pushMatrix();
    translate( centerX, centerY);
    if(bubbleScale < 1){
    scale(bubbleScale += value);    
    
    }
    image(bubble,-200,-100);
    popMatrix();
  }
  
  
}
