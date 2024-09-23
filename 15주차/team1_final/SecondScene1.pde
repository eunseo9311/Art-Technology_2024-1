class SecondScene1 {
  PImage img;
  Minim minim;
  AudioPlayer player;
  float r = 0;
  PApplet p;
  int currentTime;
  FirstSceneManage sceneManager;

  SecondScene1(PApplet p, FirstSceneManage sceneManager) {   
    this.p = p;
    this.sceneManager = sceneManager;
    img = p.loadImage("baby-simchung.png");
    minim = new Minim(p);
  }

  void start() {
    player = minim.loadFile("baby.mp3");
    player.play();
  }

  void draw() {
    currentTime++;
    p.background(255);
    p.image(img, 0, 0, p.width, p.height);
    
    r = p.sin(p.millis() / 1000.0) * 45 + 10;
    p.noStroke();
    p.fill(#B74A1F);
    p.ellipse(587, 358, r + 2, r);

    // Assuming you want to switch to ThirdScene after 10 seconds
    if (currentTime > 20) {
      sceneManager.switchToThirdScene();
    }
  }

  void stop() {
    if (player != null) {
      player.close();
    }
    minim.stop();
  }
  
  
}
