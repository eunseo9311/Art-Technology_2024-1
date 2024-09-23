public class Ship {
  float centerX;
  float centerY;
  int direction = 0;
  int rotateCount = 0;
  boolean isEvent = false;
  PImage event;

  public Ship(float x, float y) {
    centerX = x;
    centerY = y;
    event = loadImage("event.png");
  }

  public void boatFloat (PImage image,float speed) {
    pushMatrix();
       
    if(direction == 0){   
               
        translate(centerX, centerY+=speed);        
        image(image, 0,0);
      rotateCount ++;
      if(rotateCount > 20/speed){
        direction = 1;        
        rotateCount = 0;
      }      
    }else {      
               
        translate(centerX, centerY-=speed);
        image(image, 0,0);
      rotateCount ++;
      if(rotateCount > 20/speed){
        direction = 0;
        rotateCount = 0;
      }           
    }
        if(isEvent){    
        image(event, 907, -24);
    }

    popMatrix();
  }
  public void event(){
    isEvent = true;
  }
  
  public void moveBoat(float speed){
    centerX += speed;
  }
}
