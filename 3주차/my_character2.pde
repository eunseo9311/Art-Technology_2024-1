void setup(){
  size(400, 500);
}



void draw(){
  // writing your name 
  PFont myFont = createFont("Georgia", 32);
  textFont(myFont);
  fill(random(255), random(255),random(255));
  textAlign(LEFT, CENTER);  
  text("Song Eunseo", 0, 15);
  
  noStroke();
  fill(#547C5B);
  ellipse(130,120,50,80);
  ellipse(265,120,50,80);
  
  fill(0);
  rect(107,270,185,100,6);
  
  
  fill(#F2E7CD);
  ellipse(100,250,30,60);
  ellipse(300,250,30,60);
  ellipse(200,250,200,200);
  
  
  
  
  fill(#547C5B);
  
  ellipse(105,-150,30,60);
  ellipse(200,-150,30,60);
  triangle(110, -80, 150, -80, 170, -200);
  rect(105,190,185,-80,13);
  rect(105,170,185,30,28);
  triangle(110, -80, 150, -80, 170, -200);
  ellipse(105,-150,30,60);
  ellipse(200,-150,30,60);
  
  
  
  
  
  fill(0);
  ellipse(160,250,50,50);
  ellipse(240,250,50,50);
  
  fill(255);
  ellipse(155,240,20,20);
  ellipse(235,240,20,20);
  
  
  fill(#DE604A);
  arc(200, 300, 50, 30, 0.4, 3.7, CHORD);
  
  
}