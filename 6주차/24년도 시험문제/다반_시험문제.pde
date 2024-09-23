int [] cell = new int[5];
PFont myFont;
int [] count = new int[10];

void setup() {
  size(600, 240);
  myFont = createFont("Georgia", 32);
}

void mousePressed() {
  for (int i = 0; i < cell.length; i++) {
    if (i*120 <= mouseX && mouseX <= (i+1)*120 && mouseY <= 120) {
      count[i]++;
    }
    if (i*120 <= mouseX && mouseX <= (i+1)*120 && mouseY >= 120 && mouseY <=240) {
      count[i+5]++;
    }
  }
}

void draw() {
  textAlign(CENTER, CENTER);
  background(255);
  textFont(myFont);

  for (int i = 0; i < cell.length; i++) {
    if (i % 2 == 0) {
      fill(0);
    } else {
      fill(255);
    }
    rect(i * 120, 0, 120, 120);
    if (i % 2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    text(count[i], i * 120 + 60, 60);
  }

  for (int i = 0; i < cell.length; i++) {
    if (i % 2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    rect(i * 120, 120, 120, 120);
    if (i % 2 == 0) {
      fill(0);
    } else {
      fill(255);
    }
    text(count[i + 5], i * 120 + 60, 180);
  }
}