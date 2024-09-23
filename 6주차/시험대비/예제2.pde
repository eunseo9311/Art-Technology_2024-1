float x,y;
float diam;


void setup(){
  size(800,600);
  background(255);
}

void draw(){
}


void mousePressed(){
  x = random(0,width);
  y = random(0,height);
  diam = random(10,50);
  
  
  if(mouseX <= 400){;
    fill(#0000FF);
  } else {
    fill(#FF0000);
  }
  ellipse(x,y,diam,diam); 
  // if를 통해서 x좌표를 걸러내고 나서 그 다음에 원에서 색을 채워주는 거라서 ellipse를 맨 마지막에 넣어줘야함

}// end of pressed