float x, y;
float diam;
int Color = 0;

void setup(){
  size(800,600);
  rectMode(CENTER);
  background(0); //배경 한번만 넣어서 setup 에 넣어줘야 한다.
}




void draw(){
  // background(0); 이렇게 배경을 여기다가 넣으면 배경이 계속 생겨버리니까 원이 남지 않는다.
  
  diam = random(10,50);
  x = random(0,width);
  y = random(0,height);
  fill(#F01F18);
  rect(100,100,50,50);
  fill(#F08818);
  rect(200,100,50,50);
  fill(#F4F520);
  rect(300,100,50,50);
  fill(#16A732);
  rect(400,100,50,50);
  fill(#2568E8);
  rect(500,100,50,50);
}



void mousePressed(){
  if(mouseX >= 75 && mouseX <= 125 && mouseY >= 75 && mouseY <= 125){
    Color = #F01F18;
  }
  if(mouseX >= 175 && mouseX <= 225 && mouseY >= 75 && mouseY <= 125){
    Color = #F08818;
  }
  if(mouseX >= 275 && mouseX <= 325 && mouseY >= 75 && mouseY <= 125){
    Color = #F4F520;
  }
  if(mouseX >= 375 && mouseX <= 425 && mouseY >= 75 && mouseY <= 125){
    Color = #16A732;
  }
  if(mouseX >= 475 && mouseX <= 525 && mouseY >= 75 && mouseY <= 125){
    Color = #2568E8;
  }
  
  fill(Color);
  ellipse(x,y,diam,diam);
} //end of void