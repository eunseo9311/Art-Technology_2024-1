int x,y;
int diam;
color circle;
color backColor;


void setup(){
  size(800,600);
  x = 400;
  y = 300;
  diam = 300;
  circle = #FF0000;
  backColor = #FFFFFF;

}// end of void



void draw(){
  background(backColor);
  fill(circle);
  ellipse(x,y,diam,diam);
} // end of draw


void mousePressed(){
  diam = diam - 10;
  
  if(circle == #FF0000){
    circle = #FFFFFF;
    backColor = #FF0000;
  }


  else {
    circle = #FF0000;
    backColor = #FFFFFF;
  }

  if(diam < 50){
    diam = 300;
  
  }

}// end of pressed