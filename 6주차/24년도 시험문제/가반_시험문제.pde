int cnt0 = 0, cnt1 = 0;
color color0 = color(255, 0, 0); // Red
color color1 = color(255, 255, 0); // Yellow
int count = 0;

public void setup() {
  size(500, 500);
}

public void draw() {
  background(255);
  
  fill(color0);
  ellipse(250, 200, 100, 100);
  
  fill(color1);
  ellipse(250, 400, 100, 100);
  
  fill(0);
  textSize(50);
  text(count, 150, 100);
  text(mouseX, 250, 100);
  text(mouseY, 350, 100);
}

public void mousePressed() {
  if (dist(250, 200, mouseX, mouseY) <= 50) {
    if (color0 == color(255, 0, 0)) color0 = color(255, 255, 0);
    else color0 = color(255, 0, 0);
  }
  if (dist(250, 400, mouseX, mouseY) <= 50) {
    if (color1 == color(255, 0, 0)) color1 = color(255, 255, 0);
    else color1 = color(255, 0, 0);
  }
  count++;
}