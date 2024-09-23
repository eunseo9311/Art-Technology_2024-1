import ddf.minim.*;

class SixthScene1 {
  PImage img;
  PFont font;
  Minim minim;
  AudioPlayer player;
  PApplet p;
  FirstSceneManage sceneManager;
  boolean audioFinished = false;  // Add this variable to track audio status

  SixthScene1(PApplet p, FirstSceneManage sceneManager) {
    this.p = p;
    this.sceneManager = sceneManager;
    img = p.loadImage("공양미.png"); // Ensure this file is in the data folder
    font = p.createFont("Pretendard-Bold.ttf", 48);
    p.textFont(font);
    minim = new Minim(p);
  }

  void start() {
    player = minim.loadFile("#S2-2.mp3"); // Ensure this file is in the data folder
    if (player != null) {
      player.play();
    }
  }

  void draw() {
    p.background(255);
    p.image(img, 0, 0);
    p.fill(0);
    p.textSize(27);
    p.text("The monk suggested to Simbongsa that if he brought 300 bags of rice from the memorial service,", 11, 776);
    p.text("he would be able to open his eyes", 383, 809);
    
    // Check if the audio has finished playing
    if (player != null && !player.isPlaying() && !audioFinished) {
      audioFinished = true;
      sceneManager.switchToSeventhScene();  // Switch to the next scene
    }
  }

  void stop() {
    if (player != null) {
      player.close();
    }
    minim.stop();
  }
}
