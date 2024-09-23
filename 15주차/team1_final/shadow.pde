public class Shadow{
  float centerX;
  float centerY;
  PImage shadow;
  
  public Shadow(int x, int y) {
    centerX = x;
    centerY = y;  
    shadow = loadImage("shadow.png");
  }
  
  public void draw(float speed){
      image(shadow, centerX,centerY);
    
    if(centerY <380){
    
    centerX += speed;
    centerY += speed * 3;
    }
  }

}
