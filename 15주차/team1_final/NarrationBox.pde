class NarrationBox{
  PImage box;
  PFont pretendardBold;
  float x;
  float y;
  String message;
  
  public NarrationBox(String message, float x, float y){    
    box = loadImage("narration.png");
    this.message = message;
  pretendardBold = createFont("Pretendard-Bold.ttf", 36);
  }
  void draw(){
    pushMatrix();
    image(box, 4 ,591);
    pushStyle();
    drawText(message, 640,680);
    popStyle();
    popMatrix();
  }
    void drawText(String message, float x, float y) {
  fill(0);
  textAlign(CENTER);
  textFont(pretendardBold);
  textSize(36);
  text(message, x , y);
}
}
