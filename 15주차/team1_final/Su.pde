public class Su {
  float centerX;
  float centerY;
  public Su(float x, float y){
    centerX = x;
    centerY = y;
  }
  
  void jump(PImage image,float time){
    image(image, centerX-time, (centerY-(time * 0.3)));    
  }
}
