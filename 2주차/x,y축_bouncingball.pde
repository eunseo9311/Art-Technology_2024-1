
int x;
int dirx;
int y;
int diry;



void setup() {
  size(600, 400);
  x = 300;
  y = 200;
  // x=0 이라고 시작해버리면 밑에 * -1 때문에 계속 곱해져서 0만 뜨니까 x=0이 계속되서 움직이지 않게 된다.

  dirx = 3;
  diry = 2;
}

void draw() {
  background(200);


  // fill(128);
  ellipse(x, y, 50, 50);
  x = x + dirx;
  y = y + diry;


  if (x + 25 > 600) {
    dirx = dirx * -1;
    fill(random(255), random(255), random(255));
    // #ffff00 각각 하나씩 RGB를 의미한다.
  }

  if (x - 25 < 0) {
    dirx = dirx * -1;
    fill(random(255), random(255), random(255));
  } // if 도 끝날 때마다 중괄호로 묶어줘야 합니다.
  //draw 에서도 중괄호로 묶어줘야 합니다.
  // 아까 여기서 밑에 중괄호를 또 묶어주는 바람에 실행이 안 됨 지금은 draw의 바디가 끝나지 않았기 때문에 맨 밑에서 다시 draw를 묶어줘야한다. 


  if (y + 25 > 400) {
    diry = diry * -1;
    fill(random(255), random(255), random(255));
    // #ffff00 각각 하나씩 RGB를 의미한다.
  }

  if (y - 25 < 0) {
    diry = diry * -1;
    fill(random(255), random(255), random(255));
  } // if 도 끝날 때마다 중괄호로 묶어줘야 합니다.
} //draw 에서도 중괄호로 묶어줘야 합니다.