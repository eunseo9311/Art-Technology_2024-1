public class HumanSide {
  PImage body;
  PImage leg;
  PImage head;
  PImage armLeft;
  PImage armRight;
  PImage footRight;
  PImage footLeft;
  int direction;
  int rotateCount;
  int headRotateCount;
  float centerX;
  float centerY;
  float headRotate = 0;
  float armRightRotate = 0;
  float armLeftRotate = 0;
  float bodyRotate = 0;
  float footRotate = 0;
  
  float headX = -62;
  float headY = -105;
  float bodyX = -32;
  float bodyY = -75;
  float legX = -93;
  float legY = -4;
  float armRightX = -4;
  float armLeftX = -57;
  float armRightY = -7;
  float armLeftY = -12;
  float footRightX = -10;
  float footLeftX = -10;
  float footRightY = -7;
  float footLeftY = -7;
  float rotate = -0.1;
  int characterDirection = 1;

  public HumanSide(int x, int y) {
    this.centerX = x;
    this.centerY = y;
  }

  public void draw() {
    drawPart(footLeft, -25, 153, footLeftY, footLeftY, -footRotate);
    drawPart(footRight, 13, 153, footRightX, footRightY, footRotate);

    drawPart(armRight, 36, -48, armRightX, armRightY, armRightRotate);
    drawPart(leg, 3, 4, legX, legY, 0);
    drawPart(body, 0, 0, bodyX, bodyY, 0);
    drawPart(armLeft, -27, -44, armLeftX, armLeftY, armLeftRotate);

    drawPart(head, 1, -82, headX, headY, headRotate);
  }
  public void drawPart(PImage image, float x, float y, float cX, float cY, float rotate) {
    pushMatrix();

    translate(0 + x, 0 + y);
    rotate(rotate);
    image(image, cX, cY);

    popMatrix();
  }

  public void walk(float speed) {
    pushMatrix();
    translate(centerX+= characterDirection*speed*200, centerY);
    if (characterDirection != 1) {
      scale(-1, 1);
    }
    if (direction == 0) {
      rotate(rotate += speed);
      armRightRotate += speed*2;
      armLeftRotate -= speed*2;
      footRotate += speed*3;
      
      draw();

      rotateCount ++;
      if (rotateCount > (0.1 /speed)) {
        direction = 1;
        rotateCount = 0;
      }
    } else {
      rotate(rotate -= speed);
      
      armRightRotate -= speed*2;
      armLeftRotate += speed*2;
            footRotate -= speed*3;

      rotateCount ++;
      draw();
      if (rotateCount > 0.1/speed) {
        direction = 0;
        rotateCount = 0;
      }
    }
    popMatrix();
  }
  public void stand() {
    pushMatrix();
    translate(centerX, centerY);
    if (characterDirection != 1) {
      scale(-1, 1);
    }
    draw();
    popMatrix();
  }

  public void directionChange() {
    characterDirection =characterDirection * -1;
  }
  void headDown(float speed){
    headRotate += speed;
  }
  void armRightRotate(float speed){
    armRightRotate += speed;
  }
  void armLeftRotate(float speed){
    armLeftRotate += speed;
  }
  
    public void headShake(float speed) {
    pushMatrix();
    if (characterDirection != 1) {
      scale(-1, 1);
    }
    if (direction == 0) {
      
      headRotate += speed;
      

      rotateCount ++;
      if (rotateCount > (0.1 /speed)) {
        direction = 1;
        rotateCount = 0;
      }
    } else {
      headRotate -= speed;

      rotateCount ++;
      if (rotateCount > 0.1/speed) {
        direction = 0;
        rotateCount = 0;
      }
    }
    popMatrix();
  }
  void run(float speed){
    pushMatrix();
    
    translate(centerX += characterDirection*speed*200, centerY);
    if(characterDirection == -1){
      scale(-1,1);
    }
    draw();
    
    popMatrix();    
  }
  
}
