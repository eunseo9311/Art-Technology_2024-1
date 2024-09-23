public class GameScene extends Scene3 {
  Minim minim;
  AudioPlayer player;
  boolean isFinished = false;
  PImage simchungShadow;
  PImage sejaShadow;

  float team3girlx, team3girly, team3movingX, team3movingY;
  float sejaX, sejaY;
  float sejaScale;
  int shakeTimerSimchung = 0;
  int shakeTimerSeja = 0;
  float sejaMovingY = -0.5;
  float shakeAmount = 3;
  int shakeDuration = 7;
  int shakeInterval = 60;

  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

  public GameScene(PApplet p) {
    minim = new Minim(p);

    player = minim.loadFile("bubble_sound.mp3");

    simchungShadow = loadImage("simchungshadow.png");
    sejaShadow = loadImage("sejashadow.png");

    team3girlx = width / 2;
    team3girly = height * 5 / 6;

    team3movingX = randomSpeed();
    team3movingY = randomSpeed();

    sejaX = width / 2 + 40;
    sejaY = height / 6;

    sejaScale = (float) simchungShadow.height / sejaShadow.height * 1.5;
  }

  void draw() {
    pushMatrix();
    pushStyle();
    float shakeXSimchung = 0;
    float shakeYSimchung = 0;
    float shakeXSeja = 0;
    float shakeYSeja = 0;

    if (shakeTimerSimchung > 0) {
      shakeXSimchung = random(-shakeAmount, shakeAmount);
      shakeYSimchung = random(-shakeAmount, shakeAmount);
      shakeTimerSimchung--;
    } else if (frameCount % (shakeInterval / 2) == 0) {
      shakeTimerSimchung = shakeDuration;
    }

    if (shakeTimerSeja > 0) {
      shakeXSeja = random(-shakeAmount, shakeAmount);
      shakeYSeja = random(-shakeAmount, shakeAmount);
      shakeTimerSeja--;
    } else if (frameCount % shakeInterval == 0) {
      shakeTimerSeja = shakeDuration;
    }

    for (int i = 0; i < height; i++) {
      float inter = map(i, 0, height, 0, 1);
      int c = lerpColor(color(113, 199, 255), color(0, 0, 128), inter);
      stroke(c);
      line(0, i, width, i);
    }

    imageMode(CENTER);

    team3girlx += team3movingX;
    team3girly += team3movingY;

    if (team3girlx >= width * 51 / 100 || team3girlx <= width * 49 / 100) {
      team3movingX *= -1;
      team3movingX = randomSpeed() * (team3movingX > 0 ? 1 : -1);
    }

    if (team3girly >= height * 92 / 100 || team3girly <= height * 84 / 100) {
      team3movingY *= -1;
      team3movingY = randomSpeed() * (team3movingY > 0 ? 1 : -1);
    }

    sejaY += sejaMovingY;

    image(simchungShadow, team3girlx + shakeXSimchung, team3girly + shakeYSimchung);
    image(sejaShadow, sejaX + shakeXSeja, sejaY + shakeYSeja, sejaShadow.width * sejaScale, sejaShadow.height * sejaScale);

    updateBubbles();
    
    if(sejaY > team3girly ){
      isFinished = true;
    }
    popStyle();
    popMatrix();
  }

  void keyPressed() {
    if (key == ' ') {
      player.play();
      sejaMovingY = 2;
      shakeTimerSeja = shakeDuration;

      int bubbleCountAbove = int(random(2, 5));
      for (int i = 0; i < bubbleCountAbove; i++) {
        float leftLimit = sejaX - sejaShadow.width * sejaScale / 2;
        float rightLimit = sejaX + sejaShadow.width * sejaScale / 2 - 60;
        float bubbleX = random(leftLimit, rightLimit);
        float bubbleY = sejaY - sejaShadow.height * sejaScale / 2;
        float directionX = 0;
        float directionY = random(-3, -1);

        if (bubbleX < sejaX - sejaShadow.width * sejaScale / 4) {
          directionX = random(-1.5, -0.5);
        } else if (bubbleX > sejaX + sejaShadow.width * sejaScale / 4 - 60) {
          directionX = random(0.5, 1.5);
        } else {
          directionX = random(-0.5, 0.5);
        }

        bubbles.add(new Bubble(bubbleX, bubbleY, directionX, directionY));
      }

      int bubbleCountBelow = int(random(1, 3));
      for (int i = 0; i < bubbleCountBelow; i++) {
        float leftLimit = sejaX - sejaShadow.width * sejaScale / 2 + 40;
        float rightLimit = sejaX + sejaShadow.width * sejaScale / 2;
        float bubbleX = random(leftLimit, rightLimit);
        float bubbleY = sejaY + sejaShadow.height * sejaScale / 2;
        float directionX = 0;
        float directionY = random(-3, -1);

        if (bubbleX < sejaX + 20) {
          directionX = random(-1.5, -0.5);
        } else {
          directionX = random(0.5, 1.5);
        }

        bubbles.add(new Bubble(bubbleX, bubbleY, directionX, directionY));
      }
    }
  }

  void keyReleased() {
    if (key == ' ') {
      sejaMovingY = -0.5;
      player.pause();
    }
  }

  void updateBubbles() {
    for (int i = bubbles.size() - 1; i >= 0; i--) {
      Bubble b = bubbles.get(i);
      b.update();
      b.display();
      if (b.isFinished()) {
        bubbles.remove(i);
      }
    }
  }

  float randomSpeed() {
    float[] speeds = {0.1, 0.15, 0.2};
    int index = int(random(0, speeds.length));
    return speeds[index];
  }

  class Bubble {
    float x, y;
    float speedY;
    float speedX;
    float alpha;
    float size;

    Bubble(float x, float y, float speedX, float speedY) {
      this.x = x;
      this.y = y;
      this.speedX = speedX;
      this.speedY = speedY;
      this.alpha = 255;
      this.size = random(10, 20);
    }

    void update() {
      y += speedY;
      x += speedX;
      alpha -= 5;
    }

    void display() {
      noStroke();
      fill(255, 255, 255, alpha);
      ellipse(x, y, size, size);
    }

    boolean isFinished() {
      return alpha <= 0;
    }
  }
  
  
  boolean isFinished(){
    return isFinished;
  }
  void stop(){
    player.close();
    minim.stop();
  }
}
