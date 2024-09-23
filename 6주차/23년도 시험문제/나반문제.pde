int x,y;
int xDir, yDir;
int diam;
int i = 0;

int xr,yr;
int xrDir, yrDir;


void setup(){
  size(600,600);
  x = 200;
  y = 400;
  diam = 50;
  xDir = 4;
  yDir = 4;
  
  xr = 400;
  yr = 200;
  xrDir = 5;
  yrDir = 4;
  
}


void draw(){
  background(255);
  fill(255,255,0);
  ellipse(x,y,diam,diam);
 
  
  x = x + xDir;
  y = y + yDir;
  xr = xr + xrDir;
  yr = yr + yrDir;
  
  if(x < diam/2){
    xDir = xDir * -1;
  }
  if(x > width - diam/2){
    xDir = xDir * -1;
  }
  if(y < diam/2){
    yDir = yDir * -1;
  }
  if(y > height - diam/2){
    yDir = yDir * -1;
  }
  
  
  fill(255,0,0);
  if( i == 0){ //같은 거라고 해줘야 하는 상황
    fill(255,0,0); ellipse(xr,yr,diam,diam);
  }
  
  if( i == 1){
    triangle(xr,yr,xr+diam,yr,xr+diam/2,yr-diam);
  }
  
  if( i == 2){
    rect(xr,yr,diam,diam);
  }

  
  
  if(xr < diam/2){
    xrDir = xrDir * -1;
      i = 1; //이거는 같은 게 아니라 i에 1을 대입해줘야하는 상황
     
  }
  
  if(xr > width - diam/2){
    xrDir = xrDir * -1;
      i = 2;
  }
    
  if(yr < diam/2){
    yrDir = yrDir * -1;
      i = 0;
  }
  if(yr > height - diam/2){
    yrDir = yrDir * -1;
      i = 0;
  }


}