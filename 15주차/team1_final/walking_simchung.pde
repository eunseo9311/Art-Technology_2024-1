class WalkingScene extends Scene{
  int numFrames = 500;
  PImage[] images = new PImage[4];
  int currentImageIndex = 0;

  public WalkingScene() {
    stopFrameCount = 40; // 80초 동안 실행 (frameRate 10일 때)
    for (int i = 0; i < images.length; i++) {
      images[i] = loadImage((i + 1) + ".png");
    }
    frameRate(10); // 10 frames per second
  }

  @Override
  void draw() {
    super.draw();
    background(255, 255, 255);
    image(images[currentImageIndex], 0, 0, width, height);

    currentImageIndex = (currentImageIndex + 1) % images.length;
    

  }//method

}//class
