int [] bricks = new int [10];

void setup(){
  size(500,500);
  
  int i = 0;
  while (i < bricks.length){
    bricks[i] = 1;
    i++;
    
  } // end of while
  //printArray(bricks);
  
} // end of setup


void draw(){
  background(255);
  
  int i = 0;
  fill(255,0,0);
  while (i < bricks.length){
    if (bricks[i] == 0){
      fill(255);
    } else{
      fill(255,0,0);
    } // end of if
    
    
    rect(50*i,0,50,30);
    i++;
  } // end of while
  
  
  if (mousePressed && mouseY < 30){
    bricks[mouseX / 50] = 1 - bricks[mouseX / 50];
    
  } //end of if
    
 
  
  
} //end of draw