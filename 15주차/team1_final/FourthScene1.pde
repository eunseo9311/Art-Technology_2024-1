import ddf.minim.*;

class FourthScene1 {
  PImage img;
  PFont font;
  Minim minim;
  AudioPlayer player;
  PApplet p;
  FirstSceneManage sceneManager;
  boolean hasStarted = false;

  FourthScene1
(PApplet p, FirstSceneManage sceneManager) {
    this.p = p;
    this.sceneManager = sceneManager;
    img = p.loadImage("과거사.png");  // Ensure this file is in the data folder
    if (img == null) {
      println("The file '과거사.png' is missing or inaccessible, make sure the URL is valid or that the file has been added to your sketch and is readable.");
    }
    font = p.createFont("Pretendard-Bold.ttf", 45);
    p.textFont(font);
    minim = new Minim(p);
  }

  void start() {
    player = minim.loadFile("#S1-2.mp3");  // Ensure this file is in the data folder
    if (player == null) {
      println("The file '#S1-2.mp3' is missing or inaccessible, make sure the URL is valid or that the file has been added to your sketch and is readable.");
    } else {
      player.play();
      hasStarted = true;
    }
  }

  void draw() {
    p.background(255);
    if (img != null) {
      p.image(img, 0, 0);
    }
    
    p.fill(0);
    p.textSize(45);
    p.text("Simcheong lost her mother shortly after she was born", 83, 799);

    // Add logic to transition to FifthScene
    if (player != null && !player.isPlaying() && hasStarted) {
      sceneManager.switchToFifthScene();
    }
  }

  void stop() {
    if (player != null) {
      player.close();
    }
    minim.stop();
  }
}
