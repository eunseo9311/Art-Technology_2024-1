void setup(){
  size(500,500);
  
}


void song(){
  pushStyle();
  fill(255,0,0);
  ellipse(width/2, height/2, 100, 100);
  rect(0,0,100,100);
  popStyle();
}


void song2(int x,int y){
  
  ellipse(x,y,50,50);
  ellipse(x*2,y*2,50,50);
}

void draw(){
  song();
  song2(mouseX,mouseY);
}