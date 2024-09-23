
int x;
int dirx;


void setup(){
  size(600,400);
  x = 300;
  dirx = 4;
}
  
void draw(){
  background(200);
  
  
 // fill(128);
  ellipse(x,100,50,50);
  x = x + dirx;
  
  
  if (x + 25 > 600) {
    dirx = dirx * -1;
    fill(255,0,0);
  }
    
  if (x - 25 < 0){
    dirx = dirx * -1;
    fill(255,255,0);
  }
}