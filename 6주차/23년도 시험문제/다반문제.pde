int x = 300;
int y = 300;
color eColor;
int i = 0;

void setup(){
  size(600,600);
  
}



void draw(){
  background(255);
  fill(eColor);
  ellipse(x,y,300,300);
  
  if(i % 7 == 0){ //나머지를 구해야 계속 색이 변한다
    eColor = #ff0000;
  }
  if(i % 7 == 1){ //나머지를 구해야 계속 색이 변한다
    eColor = #ff7f00;
  }
  if(i % 7 == 2){ //나머지를 구해야 계속 색이 변한다
    eColor = #ffff00;
  }
  if(i % 7 == 3){ //나머지를 구해야 계속 색이 변한다
    eColor = #00ff00;
  }
  if(i % 7 == 4){ //나머지를 구해야 계속 색이 변한다
    eColor = #0000ff;
  }
  if(i % 7 == 5){ //나머지를 구해야 계속 색이 변한다
    eColor = #4b0082;
  }
  if(i % 7 == 6){ //나머지를 구해야 계속 색이 변한다
    eColor = #9400d3;
  }
  
  if(mouseY < y + 150 && mouseY > y && mousePressed){ //mousePressed를 변수는 조건을 넣을 때 사용하는거고, 함수로 넣는거는...
    y += 1; // mouseY > y 인 것도 잊지 말고 넣어주자!
  }

  if(mouseY > y - 150 && mouseY < y && mousePressed){
    y -= 1;
    
  }
  
}// end of draw

void mousePressed(){
  if(mouseX > x - 150 && mouseX < x + 150 && mouseY < y + 150 && mouseY > y - 150){ //mousePressed 는 함수로 사용해야 한다 변수로 사용하지 말자
    i += 1; // 이렇게 마우스를 눌렀을 때 i에 값을 계속 더해주면서 바꾸게 해주는 거다
}

}// end of pressed