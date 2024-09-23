public class OffScene extends Scene {
  
  int offCount = 0;
  PImage img1, img2, backgroundImg;
  float img1X, img1Y, img2X, img2Y;
  float img1Scale = 0.1285; // Scale factor for img1 (no scaling)
  float img2Scale = 0.1285; // Scale factor for img2 (50% scaling)
  float backgroundScale = 0.185; // Scale factor for background image (50% scaling)

  public OffScene() {
    size(1280, 832); // Set the size of the window
    img1 = loadImage("꽃신 한 짝.png");
    img2 = loadImage("꽃신 한 짝2.png");
    backgroundImg = loadImage("버선발심청_대지 1.png");

    // Calculate initial positions
    img1X = 450+10;
    img1Y = 400-30;
    img2X = 660+60;
    img2Y = 400-48;
  }
  
  @Override
  void draw() {
    super.draw();
    background(255);
    image(backgroundImg, -100, 0, backgroundImg.width * backgroundScale, backgroundImg.height * backgroundScale);
    image(img1, img1X, img1Y, img1.width * img1Scale, img1.height * img1Scale);
    image(img2, img2X, img2Y, img2.width * img2Scale, img2.height * img2Scale);
  }

  void mousePressed() {
    if (mouseX > img1X && mouseX < img1X + img1.width * img1Scale && mouseY > img1Y && mouseY < img1Y + img1.height * img1Scale) {
      img1X -= 500; // Move img1 left
      offCount++;
    }
    if (mouseX > img2X && mouseX < img2X + img2.width * img2Scale && mouseY > img2Y && mouseY < img2Y + img2.height * img2Scale) {
      img2X += 500; // Move img2 right
      offCount++;
    }
  }
  
  boolean isFinished() {
    return (offCount == 2);
    //return currentFrameCount >= stopFrameCount;
  }
  
} //class
