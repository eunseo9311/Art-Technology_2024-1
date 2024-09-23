int x,y;
int i = 0;
int dirX,dirY;
int [] c = {#FF0000, #0000FF};
int Color = c[0];

void setup(){
  size(300,300);
  x= 160;
  y = 130;
  dirX = 5;
  dirY = 3;

} //end of void


void draw(){
  background(0);
  rectMode(CENTER);
  fill(255);
  rect(150,150,30,30);
  if (i > 0){
    fill(Color);
    ellipse(x,y,20,20);
    x += dirX;
    y += dirY;
    
    
  if (x < 10 || x > 290){
    dirX *= -1;
    Color = c[0];
  }
  if (y < 10 || y > 290){
    dirY *= -1;
    Color = c[1];
  }
    
  }
 
 

}// end of draw
void mousePressed(){
    if (mouseX <= 155 && mouseX >= 145 && mouseY <= 155 && mouseY >= 145){
    i++;
    
}
}