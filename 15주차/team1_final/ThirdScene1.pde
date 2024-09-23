class ThirdScene1 {
  PImage img;
  PApplet p;
  FirstSceneManage sceneManager;
  boolean hasStarted = false;
  int startTime;

  ThirdScene1(PApplet p, FirstSceneManage sceneManager) {
    this.p = p;
    this.sceneManager = sceneManager;
    img = p.loadImage("심청이가족.png");
  }

  void start() {
    hasStarted = true;
    startTime = p.millis();
  }

  void draw() {
    p.background(255);
    p.image(img, 0, 0);

    if (hasStarted && p.millis() - startTime > 5000) { // Switch to FourthScene after 5 seconds
      sceneManager.switchToFourthScene();
    }
  }

  void stop() {
    // Any cleanup needed for ThirdScene1 can be done here
  }
}
