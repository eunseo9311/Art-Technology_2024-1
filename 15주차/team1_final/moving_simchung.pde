// 심청이 찐 갑판에서 걷는거
public class MovingScene extends Scene{ //////

  int numFrames = 500;
  PImage[] images = new PImage[14]; //new 객체.
  int currentImageIndex = 0; 
  
  public MovingScene() { //draw 말고 생성자를 넣어주는걸로 해야한다.
    stopFrameCount = 80;  ////
    for (int i = 0; i < images.length; i++) {
      images[i] = loadImage((i + 21) + ".png");
    }
    frameRate(10); // 2 frames per second (0.5 seconds per frame)
  }
  
  @Override
  void draw() {
    super.draw();    ////
    background(255, 255, 255);
    image(images[currentImageIndex], 0, 0, width, height);

    currentImageIndex = (currentImageIndex + 1) % images.length;
  }
  
}

// public 장식(?)-> 호출가능, 객체 생성 가능.  
// private -> 접근제한자, 객체생성 불가.
