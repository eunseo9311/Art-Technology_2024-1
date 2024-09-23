
int x;
int dirx;
int y;
int diry;
color padColor;
int diam, padX, padY, padWidth, padHeight;
// int setup !!



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
  //int = x; like this set up !!!!!!!!!!!!!!!!
  
}

void draw() {
  background(200);


  // fill(128);
  ellipse(x, y, diam, diam);
  x = x + dirx;
  y = y + diry;


  if (x + diam/2 > 600) {
    dirx = dirx * -1;
    fill(random(255), random(255), random(255));
    // #ffff00 각각 하나씩 RGB를 의미한다.
  }

  if (x - diam/2 < 0) {
    dirx = dirx * -1;
    fill(random(255), random(255), random(255));
  } // if 도 끝날 때마다 중괄호로 묶어줘야 합니다.
  //draw 에서도 중괄호로 묶어줘야 합니다.
  // 아까 여기서 밑에 중괄호를 또 묶어주는 바람에 실행이 안 됨 지금은 draw의 바디가 끝나지 않았기 때문에 맨 밑에서 다시 draw를 묶어줘야한다.


  if (y + diam/2 > 400) {
    diry = diry * -1;
    fill(random(255), random(255), random(255));
    // #ffff00 각각 하나씩 RGB를 의미한다.
  }

  if (y - diam/2 < 0) {
    diry = diry * -1;
    fill(random(255), random(255), random(255));
  }
  
  
  //pad drawing
  fill(padColor);
  padX = mouseX - padWidth / 2;
  rect(padX, padY, padWidth, padHeight);
  
  
  //pad bouncing checking
  if(x > padX && x < padX + padWidth && y + diam/2 > padY){
    diry *= -1;
  } // end of if 


} // end of draw