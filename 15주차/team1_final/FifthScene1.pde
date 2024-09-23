import ddf.minim.*;

class FifthScene1 {
  PImage bg;
  PImage dad;
  PImage wave1;
  PImage wave2;
  PImage wave3;
  PImage wave4;
  PImage wave5;
  PImage bd;
  PImage save;

  float wave1X = -247;
  float wave1StartX = -247;
  float wave1Speed = 2;
  float wave1Range = 20;

  float wave2X = -353;
  float wave2StartX = -353;
  float wave2Speed = 1;
  float wave2Range = 5;

  float wave3X = -328;
  float wave3StartX = -328;
  float wave3Speed = 1;
  float wave3Range = 5;

  float wave4X = -178;
  float wave4StartX = -178;
  float wave4Speed = -1;
  float wave4Range = 5;

  float wave5X = -191;
  float wave5StartX = -191;
  float wave5Speed = -1;
  float wave5Range = 5;

  float dadY = 1;
  float dadStartY = 1;
  float dadSpeed = 1;
  float dadRange = 10;

  float bdX = 372;
  float bdY = -30;
  boolean dragging = false;
  float dragOffsetX;
  float dragOffsetY;

  boolean showSave = false;
  float saveX = -160;
  float saveY = -60;
  float targetSaveX = -160;

  boolean audioPlayed = false;  // Variable to track if audio has started playing

  PFont font;
  Minim minim;
  AudioPlayer player;
  PApplet p;
  FirstSceneManage sceneManager;
  boolean audioFinished = false;  // Variable to track audio playback status

  FifthScene1
(PApplet p, FirstSceneManage sceneManager) {
    this.p = p;
    this.sceneManager = sceneManager;
    bg = p.loadImage("일러 호수.png");
    dad = p.loadImage("물에-빠진-심봉사.png");
    save = p.loadImage("구하는중.png");
    wave1 = p.loadImage("물결1.png");
    wave2 = p.loadImage("물결2.png");
    wave3 = p.loadImage("물결3.png");
    wave4 = p.loadImage("물결4.png");
    wave5 = p.loadImage("물결5.png");
    bd = p.loadImage("스님.png");

    font = p.createFont("Pretendard-Bold.ttf", 45);
    p.textFont(font);
    
    minim = new Minim(p);
  }

  void start() {
    player = minim.loadFile("#S2-1.mp3");
  }

  void draw() {
    p.background(255);
    p.image(bg, 0, 0);

    if (showSave) {
      if (!audioPlayed) {
        player.play();
        audioPlayed = true;
      }
      saveX = p.lerp(saveX, targetSaveX, 0.05);
      p.image(save, saveX, saveY);
      p.fill(0);
      p.textSize(45);
      p.text("The monk saved Simbongsa from drowning", 175, 799);
      if (player.isPlaying() == false && !audioFinished) {
        audioFinished = true;  // Mark audio as finished when it stops playing
      }
    } else {
      boolean withinRegion = (p.mouseX >= 200 && p.mouseX <= 550 && p.mouseY >= 0 && p.mouseY <= 600);
      if (withinRegion) {
        showSave = true;
        targetSaveX = 240;
      } else {
        p.image(dad, -143, dadY);
        dadY += dadSpeed;
        if (dadY > dadStartY + dadRange || dadY < dadStartY - dadRange) {
          dadSpeed *= -1;
        }
        p.image(wave1, wave1X, 11);
        p.image(wave2, wave2X, -61);
        p.image(wave3, wave3X, -83);
        p.image(wave4, wave4X, -60);
        p.image(wave5, wave5X, -77);
        p.image(bd, bdX, bdY);
        wave1X += wave1Speed;
        if (wave1X > wave1StartX + wave1Range || wave1X < wave1StartX - wave1Range) {
          wave1Speed *= -1;
        }
        wave2X += wave2Speed;
        if (wave2X > wave2StartX + wave2Range || wave2X < wave2StartX - wave2Range) {
          wave2Speed *= -1;
        }
        wave3X += wave3Speed;
        if (wave3X > wave3StartX + wave3Range || wave3X < wave3StartX - wave3Range) {
          wave3Speed *= -1;
        }
        wave4X += wave4Speed;
        if (wave4X > wave4StartX + wave4Range || wave4X < wave4StartX - wave4Range) {
          wave4Speed *= -1;
        }
        wave5X += wave5Speed;
        if (wave5X > wave5StartX + wave5Range || wave5X < wave5StartX - wave5Range) {
          wave5Speed *= -1;
        }
      }
    }

    // Check if conditions are met to transition to SixthScene
    if (showSave && audioFinished) {
      sceneManager.switchToSixthScene();
    }
  }

  void mousePressed() {
    if (p.mouseX > bdX && p.mouseX < bdX + bd.width && p.mouseY > bdY && p.mouseY < bdY + bd.height) {
      dragging = true;
      dragOffsetX = p.mouseX - bdX;
      dragOffsetY = p.mouseY - bdY;
    }
  }

  void mouseReleased() {
    dragging = false;
  }

  void mouseDragged() {
    if (dragging) {
      bdX = p.mouseX - dragOffsetX;
      bdY = p.mouseY - dragOffsetY;
    }
  }

  void stop() {
    if (player != null) {
      player.close();
    }
    minim.stop();
  }
}
