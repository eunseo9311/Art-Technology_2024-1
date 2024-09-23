public class HairScene extends Scene {

  PImage img1, img2, ribbon;
  boolean switched = false;
  boolean dragging = false;
  float ribbonX, ribbonY;
  float initialRibbonX;

  public HairScene() { ////은서야 생성자!!!
    stopFrameCount = 10;
    img1 = loadImage("머리묶 댕기푼 심청이_대지 1.png");
    img2 = loadImage("머리푼 댕기푼 심청이_대지 1.png");
    ribbon = loadImage("심청이 댕기_대지 1.png");

    // Resize the ribbon image to make it smaller
    ribbon.resize(ribbon.width / 4, ribbon.height / 4);

    ribbonX = width / 4 - ribbon.width / 2;  // Center the ribbon
    ribbonY = height / 1.15 - ribbon.height / 2;
  }

  void draw() {
    background(255);
    if (switched) {
      currentFrameCount++;
      image(img2, 0, 0, width, height);  // Display the second image
    } else {
      image(img1, 0, 0, width, height);  // Display the first image
    }
    image(ribbon, ribbonX, ribbonY);  // Display the ribbon
  }

  void mousePressed() {
    // Check if the mouse is over the ribbon
    if (mouseX > ribbonX && mouseX < ribbonX + ribbon.width && mouseY > ribbonY && mouseY < ribbonY + ribbon.height) {
      dragging = true;
      initialRibbonX = ribbonX;
    }
  }

  void mouseDragged() {
    if (dragging) {
      ribbonX = mouseX - ribbon.width / 2;  // Center ribbon to mouse
      ribbonY = mouseY - ribbon.height / 2;

      // Check if the ribbon's x-coordinate has changed more than 30 pixels to the left
      if (initialRibbonX - ribbonX > 70) {
        switched = true;
        dragging = false;  // Stop dragging once the background has switched
      }
    }
  }

  void mouseReleased() {
    dragging = false;
  }

}
// switched 변수 current 증가시키고 ...
