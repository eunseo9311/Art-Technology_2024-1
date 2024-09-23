int x;
int dirx;
int y;
int diry;
color padColor;
int diam, padX, padY, padWidth, padHeight;
int minPadWidth = 50;  // Minimum width for the pad to prevent it from shrinking too much

void setup() {
  size(600, 400);
  x = 300;
  y = 200;
  diam = 50;
  dirx = 4;
  diry = 3;
  padColor = #32E365;
  padHeight = 30;
  padWidth = 300;
  padX = 0;
  padY = height - padHeight;
}

void draw() {
  background(200);

  // Ball drawing
  ellipse(x, y, diam, diam);
  x = x + dirx;
  y = y + diry;

  // Ball bouncing on right and left walls
  if (x + diam/2 > 600) {
    dirx = dirx * -1;
    fill(random(255), random(255), random(255));
  }

  if (x - diam/2 < 0) {
    dirx = dirx * -1;
    fill(random(255), random(255), random(255));
  }

  // Ball bouncing on top and bottom walls
  if (y + diam/2 > 400) {
    diry = diry * -1;
    fill(random(255), random(255), random(255));
  }

  if (y - diam/2 < 0) {
    diry = diry * -1;
    fill(random(255), random(255), random(255));
  }

  // Pad drawing
  fill(padColor);
  padX = mouseX - padWidth / 2;
  rect(padX, padY, padWidth, padHeight);

  // Pad bouncing check
  if (x > padX && x < padX + padWidth && y + diam/2 > padY) {
    diry *= -1;
    // Shrink the padWidth by 20 units
    if (padWidth > minPadWidth) {
      padWidth -= 20;
    }
  }
}
