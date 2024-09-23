int x, y;
boolean clicked = false; 

int gameBackColor;
int EyeColor;
int backX=0, eyeY=0, coinX=0, coinX2=0, coinX3=0, coinX4=0;
float  TurtleX=0,fishX=0;


void setup() {
  size(960, 540);
  
  if(x>400){
      eyeY=eyeY+x/20;
   }
}

void mousePressed() {
  clicked = true;
 
 if (gameBackColor ==  #21C5D6) {
    gameBackColor = #040F4D;
  } else {
    gameBackColor = #21C5D6;
  }
}


   
void draw() { 
 if (!clicked) {
    background(#6F85FF); 
    Title();
    Bottom();
    PlayerSelect();
    
  } else {
    
    GameBackground();
    Mario();
    GameBottom();
    Pipe();
    
    
    Coin();
    
    
    Mushroom();
    Fish();
    brick();
    randomBox1();
    randomBox2();
    Turtle();
}
  
  
  
  if(backX==width){
    backX=0-width;
  } else {
    backX++;
  }
 
  if(fishX==width){
    fishX=0-width/4;
  } else {
    fishX=fishX+1.5;
  }
 
 if(TurtleX==width){
    TurtleX=0-width;
  } else {
    TurtleX=TurtleX+0.5;
  }
 
  
  
}

void GameBackground(){
   
        background(gameBackColor); 
  
    
    stroke(#68FFFE);
    strokeWeight(10);
    line(150+backX,-10,-50+backX,960);
    
    strokeWeight(50);
    line(200+backX,-10,-10+backX,960);
    
    strokeWeight(80);
    line(370+backX,-10,150+backX,960);
    
    strokeWeight(30);
    line(570+backX,-10,350+backX,960);
    
    strokeWeight(70);
    line(890+backX,-10,670+backX,960);
    
    strokeWeight(10);
    line(950+backX,-10,730+backX,960);

}


void Title() {
  //가장 큰 빨간 박
  noStroke();
  fill(#D54B00);
  rect(width/4, height/4, 500, 250);
  
   // S
  fill(#D9D9D9);
  noStroke();
  rect(width/2 - 209, height/2 - 62.5, 10.625, 26.625, 10);
  rect(width/2 - 196, height/2 - 42.5, 10.625, 26.625, 10);
  rect(width/2 - 208.5, height/2 - 65, 22.915, 10.625, 10);
  rect(width/2 - 208.5, height/2 - 46, 22.915, 10.625, 10);
  rect(width/2 - 208.5, height/2 - 25, 22.915, 10.625, 10);
  
  // U
  fill(#D9D9D9);
  noStroke();
  rect(width/2 - 175, height/2 - 65 , 10.445, 50, 10);
  rect(width/2 - 157.5, height/2 - 65 , 10.445, 50, 10);
  rect(width/2 - 175.5, height/2 - 24.5, 28.75, 10.735, 10);
  
  // P
  fill(#D9D9D9);
  noStroke();
  rect(width/2 - 135, height/2 - 60 , 10.445, 43.335, 10);
  rect(width/2 - 115, height/2 - 62.5, 10.445, 21.5, 10);
  rect(width/2 - 135 , height/2 - 65, 28.75, 10.735, 10);
  rect(width/2 - 135 , height/2 - 47.5, 28.75, 10.735, 10);
  
  // E
  fill(#D9D9D9);
  noStroke();
  rect(width/2 - 100, height/2 - 65, 10.445, 43.335, 10);
  rect(width/2 - 100, height/2 - 65, 28.75, 10.735, 10);
  rect(width/2 - 100, height/2 - 47.5, 28.75, 10.735, 10);
  rect(width/2 - 100, height/2 - 30, 28.75, 10.735, 10);

  
  //R
  fill(#D9D9D9);
  noStroke();
  rect(width/2-65, height/2-60, 10.4, 43.3, 10);
  rect(width/2-46, height/2-65, 10.4, 21.5, 10);
  rect(width/2-65, height/2-65, 28.75, 10.7, 10);
  rect(width/2-65, height/2-50, 28.75, 10.7, 10);
  
  stroke(#D9D9D9);
  strokeWeight(10);
  line(425, 225, 440, 248);
  
  //M
  fill(#D9D9D9);
  noStroke();
  rect(width/2-210, height/2, 15, 53, 10);
  rect(width/2-185, height/2, 15, 53, 10);
  rect(width/2-160, height/2, 15, 53, 10);
  
  rect(width/2-207, height/2, 58, 21, 10);
  
  //A
  fill(#D9D9D9);
  noStroke();
  rect(width/2-135, height/2, 15, 53, 10);
  rect(width/2-110, height/2, 15, 53, 10);
  
  rect(width/2-132, height/2, 35, 16, 10);
  rect(width/2-132, height/2+25, 35, 16, 10);
  
  //R
  fill(#D9D9D9);
  noStroke();
  rect(width/2-85, height/2, 15, 53, 10);
  rect(width/2-60, height/2, 14, 33, 10);

  rect(width/2-82, height/2, 35, 16, 10);
  rect(width/2-82, height/2+20, 35, 16, 10);
  
  stroke(#D9D9D9);
  strokeWeight(15);
  line(415, 300, 425, 315);
  
  //I
  rect(width/2-30, height/2+7, 3, 40, 10);
  
  //O
  rect(width/2, height/2+7, 3, 40, 30);
  rect(35+width/2, height/2+7, 3, 40, 20);
  
  rect(width/2, height/2+45, 35, 3, 20);
  rect(width/2, height/2+5, 35, 6, 20);

}

void Mario(){
  
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      x=x+2;
    } else if (key == 'a' || key == 'A') {
      x=x-2;
  } else if (key == 'w' || key == 'W'){
    y=y-5; 
    }
    else if (key == 'x' || key == 'X'){
    y=y+5;
   }
  }
  
 
  if ((height/2+110+y) == 0-height/2+187.5)  {
  y = 0;
}

//바닥 차단 
if ((height/2+110+y) == height-120)  {
  y = 0;
}


//좌측 벽 차단 
 if ((width/2-445+x) <= 0) {
  x = 0; 
}

//우측 벽 차단 
if ((width/2-445+x) >= width) {
  x = 0; 
}
  
  
  //pipe 좌측 차단 
 if(((width/2-440+x) <= 180)){
    if (((width/2-440+x) >= 165)) {
        if(((height/2+110+y) >= 350)){
          x = 125; 
        }
    }
   }
   
   //pipe 상단 차단 
  if((( width/2-415+x) <= 370)){
      if ((( width/2-415+x) >= 220)) {
        if(((height/2+187.5+y) >= 380)){
          EyeColor=#000000;
          x=0;
          y=0;
        }
        }
  }  
  
  //pipe 우측 차단 
   if((( width/2-455+x) <= 370)){
      if ((( width/2-455+x) >= 360)) {
        if(((height/2+187.5+y) >= 390)){
          x=380;
        }
        }
  }  
  
  //버섯 좌측 차단 
  if(((width/2-440+x) <= 600)){
    if (((width/2-440+x) >= 560)) {
        if(((height/2+110+y) >= 360)){
          x = 520; 
        }
    }
   }
   
   //바닥 상단 차단 
   if(((width/2-415+x) <= width)){
    if (((width/2-415+x) >= 600)) {
        if(((height/2+187.5+y) >= 350)){
          y = -115; 
        }
    }
   }
   
   
   // 상단 차단   
         if(((height/2+110+y) <= 0)){

          y = -(height/2+110+y)+10-height ; 
}
   // 벽돌 차단   
   
      if(((height/2+110+y) >= (height/2-70))){
        if(((height/2+110+y) <= (height/2-50))){
         if (((width/2-415+x) >= width/2-90)) {
            if (((width/2-415+x) <= width/2+180)) {
          y = -(height/2+110+y)-(height/2-110) +220 ; 
             }
         }
        }
       }
           
        if(((height/2+110+y) >= (height/2-120))){
         if(((height/2+110+y) <= (height/2-100))){
         if (((width/2-415+x) >= width/2-400)) {
            if (((width/2-415+x) <= width/2-220)) {
          y = -(height/2+110+y)-(height/2-110)+130 ; 
             }
           }
          }
         }
      
   //코인 1 충돌 차단 
   if(((width/2-440+x) <= 130)){
    if (((width/2-440+x) >= 130)) {
        if(((height/2+110+y) >= 325)){
          EyeColor=#FFD300;
          x = 80; 
        }
    }
   }
   
   //코인 2 충돌 차단 
   if(((width/2-440+x) <= 420)){
    if (((width/2-440+x) >= 420)) {
        if(((height/2+110+y) >= 325)){
          EyeColor=#FFD300;
          x =380; 
        }
    }
   }
   
   //코인 3번 충돌 차단 
   if(((width/2-440+x) <= 512)){
    if (((width/2-440+x) >= 512)) {
        if(((height/2+110+y) >= 325)){
          EyeColor=#FFD300;
          x =480; 
        }
    }
   }
   
      
  //코인 4번 충돌 차단 
   if(((width/2-440+x) <= 800)){
    if (((width/2-440+x) >= 800)) {
        if(((height/2+110+y) >= 220)){
          EyeColor=#FFD300;
          x=780;
        }
    }
   }
    
     //turtle 
   if(((width/2-440+x) <= 140+width/2-355-TurtleX)){
    if (((width/2-440+x) >= 140+width/2-355-TurtleX)){
      if(((height/2+110+y) <= height-70-160)){
        if(((height/2+110+y) >= height-70-120)){
          x=0;
          y=0;
        }
      }
        
    }
   }
    
    
   
  noStroke();
  
  //hat
  fill(#F54235);
  rect(width/2-445+x,height/2+110+y,30,5);
  rect(width/2-450+x,5+height/2+110+y,55,5);
  
  //face
  fill(#795448);
  rect(width/2-450+x,120+height/2+y,20,7.5);
  rect(width/2-440+x,height/2+125+y,7.5,15);
  rect(width/2-455+x,height/2+127.5+y,5,12.5);
  rect(width/2-437.5+x,132.5+height/2+y,10,7.5);
  rect(width/2-450+x,height/2+140+y,10,7.5);

  fill(#FFC206);
  rect(width/2-430+x,height/2+120+y,10,20);
  rect(width/2-420+x,height/2+120+y,5,12.5);
  rect(width/2-410+x,height/2+120+y,7.5,12.5);
  rect(width/2-410+x,height/2+127.5+y,15,5);
  rect(width/2-450+x,height/2+127.5+y,10,12.5);
  rect(width/2-435+x,height/2+127.5+y,5,5);
  rect(width/2-420+x,height/2+132.5+y,10,7.5);
  rect(width/2-402.5+x,height/2+132.5+y,15,7.5);
  rect(width/2-440+x,height/2+140+y,27.5,10);
  rect(width/2-412.5+x,height/2+145+y,12.5,5);

  fill(EyeColor);
  rect(width/2-415+x,height/2+120+y,5,12.5);
  fill(#000000);
  rect(width/2-410+x,height/2+132.5+y,7.5,7.5);
  rect(width/2-412.5+x,height/2+140+y,20,5);
  
  
  //body
  fill(#F54235);
  rect(width/2-447.5+x,height/2+150+y,50,5);
  rect(width/2-452.5+x,height/2+155+y,60,5);
  rect(width/2-457.5+x,height/2+160+y,70,5);
  
  fill(#FFC206);
  rect(width/2-457.5+x,height/2+165+y,70,15);
  
  
  fill(#0040ff);
  rect(width/2-437.5+x,height/2+150+y,5,9);
  rect(width/2-412.5+x,height/2+150+y,5,9);
  rect(width/2-437.5+x,height/2+159+y,30,6);

  rect(width/2-445+x,height/2+165+y,7.5,7.5);
  rect(width/2-432.5+x,height/2+165+y,20,7.5);
  rect(width/2-412.5+x,height/2+170+y,5,2.5);
  rect(width/2-407.5+x,height/2+165+y,7.5,7.5);
  rect(width/2-437.5+x,height/2+170+y,2.5,2.5);
  rect(width/2-445+x,height/2+172.5+y,45,7.5);
  
  rect(width/2-445+x,height/2+180+y,20,7.5);
  rect(width/2-420+x,height/2+180+y,20,7.5);
  

  //foot
  fill(#8D5523);
  rect(width/2-452.5+x,height/2+187.5+y,22.5,7.5);
  rect(width/2-415+x,height/2+187.5+y,22.5,7.5);

  rect(width/2-457.5+x,height/2+195+y,27.5,7.5);
  rect(width/2-415+x,height/2+195+y,27.5,7.5);

}

void Bottom() {
  noStroke();
  fill(#DD4802);
  rect(0,height-75,width,75);
}

void PlayerSelect(){
  noStroke();
  fill(#FF9900);
  triangle(width/2-15-70,405, width/2-15 -70, 435, width/2+15-70, 420);
  
  textSize(24);
  fill(#ffffff);
  text("1 Player Game", width/2-50, 428);
}

void Pipe(){
  fill(#2B6C05);
  rect(245,400,100,80);
  rect(220,380,150,20);
  
}

void GameBottom(){
  fill(#E3E3B0);
  rect(0,height-60,width,70);
  rect(700,360,260,130);
}

void Coin() {
  
  //코인 1번 충돌 차단 
   if(((width/2-440+x) <= 150)){
    if (((width/2-440+x) >= 100)) {
        if(((height/2+110+y) >= 325)){
          coinX=coinX+1000;
        }
    }
   }
   
    
  //코인 2번 충돌 차단 
 if(((width/2-440+x) <= 440)){
    if (((width/2-440+x) >= 420)) {
        if(((height/2+110+y) >= 325)){
          coinX2=coinX2+1000;
        }
    }
   }
   
    
  //코인 3번 충돌 차단 
   if(((width/2-440+x) <= 512)){
    if (((width/2-440+x) >= 490)) {
        if(((height/2+110+y) >= 325)){
          coinX3=coinX3+1000;
        }
    }
   }
   
      
  //코인 4번 충돌 차단 
   if(((width/2-440+x) <= 820)){
    if (((width/2-440+x) >= 800)) {
        if(((height/2+110+y) >= 220)){
          coinX4=coinX4+1000;
        }
    }
   }
   
   
  fill(245, 238, 27);
  ellipse(540+coinX3, 445, 50, 50);
  fill(229, 163, 19);
  rect (533+coinX3, 432, 13, 29);
  
  fill(245, 238, 27);
  ellipse(157+coinX, 445, 50, 50);
  fill(229, 163, 19);
  rect (151+coinX, 432, 13, 29);
  
  fill(245, 238, 27);
  ellipse(839+coinX4, 315, 50, 50);
  fill(229, 163, 19);
  rect (833+coinX4, 302, 13, 29);
  
  fill(245, 238, 27);
  ellipse(447+coinX2, 445, 50, 50);
  fill(229, 163, 19);
  rect (440+coinX2, 432, 13, 29);
}

void Mushroom() {
  //yellow mushroom
  fill(249, 250, 151);
  rect(725, 425, 33, 57);
  fill(#FAA61E);
  ellipse(742, 416, 85, 50);

  //red mushroom
  fill(240, 98, 85);
  rect(632, 405, 43, 77);
  fill(245, 154, 146);
  ellipse(656, 405, 97, 59);
}

void Fish(){
  
  

  
   //body
  fill(#DB0707);
  rect(width/2+230-fishX,height/2-196,90,73);
  
  //eyes
  fill(255);
  rect(width/2+225-fishX,height/2-185,15,24);
  fill(0);
  rect(width/2+226-fishX,height/2-176+eyeY,6,12);
  
  //belly
  fill(255);
  rect(width/2+320-fishX,height/2-150,-90,26);
  
  //lip
  fill(#EC8F8F);
  rect(width/2+240-fishX,height/2-157,-17,12);
  rect(width/2+240-fishX,height/2-145,-17,12);
  
  //fin
  fill(#F3D465);
  rect(width/2+258-fishX,height/2-180,6,42);
  rect(width/2+320-fishX,height/2-180,16,42);
  
}

void brick(){
  fill(#CB6E10);
  rect(70+width/2,height/2-110,80,80);
  
  stroke(0);
  strokeWeight(3);
  line(70+width/2,-85+height/2,150+width/2,-85+height/2);
  line(70+width/2,-55+height/2,150+width/2,-55+height/2);
    
  line(85+width/2,-85+height/2,85+width/2,-55+height/2);
  line(125+width/2,-85+height/2,125+width/2,-55+height/2);
  line(105+width/2,-85+height/2,105+width/2,-110+height/2);
  line(105+width/2,-55+height/2,105+width/2,height/2-30);
  
  noStroke();
  fill(#CB6E10);
  rect(-10+width/2,height/2-110,80,80);
  
  stroke(0);
  strokeWeight(3);
  line(-10+width/2,-85+height/2,70+width/2,-85+height/2);
  line(-10+width/2,-55+height/2,70+width/2,-55+height/2);
    
  line(5+width/2,-85+height/2,5+width/2,-55+height/2);
  line(45+width/2,-85+height/2,45+width/2,-55+height/2);
  line(25+width/2,-85+height/2,25+width/2,-110+height/2);
  line(25+width/2,-55+height/2,25+width/2,height/2-30);
}

//물음표
void randomBox1(){
  noStroke();
   fill(#E5C33A);
   rect(width/2-90,-110+height/2,80,80);
    
  fill(#FFFFFF);
  textSize(80);
  text("?",width/2-65,-45+height/2);
}


void randomBox2(){
  //느낌표
  noStroke();
  fill(#E5C33A);
  rect(width/2-320,height/2-180,80,80);
    
  fill(#FFFFFF);
  textSize(80);
  text("!",width/2-290,height/2-115);
  
  //물음표
  fill(#E5C33A);
  rect(width/2-400,height/2-180,80,80);
    
  fill(#FFFFFF);
  textSize(80);
  text("?",width/2-380,height/2-115);
}

void Turtle(){
   //face
  fill(#D9D9D9);
  ellipse(140+width/2-355-TurtleX,height-70-120,43,38);
  //body
  ellipse(185+width/2-355-TurtleX,height-72-120,67,53);
  //shell
  fill(#58A1CA);
  arc(648-355-TurtleX,465-120,109,104,PI,TWO_PI);
  fill(255);
  rect(685-355-TurtleX,748-120,142,16);
  //eye
  fill(0);
  rect(128+width/2-340-TurtleX,height-75-120,9,12);
  fill(#D9D9D9);
  rect(608-355-TurtleX,467-120,4,8);
  //pattern
  stroke(0);
  strokeWeight(1);
  line(624-355-TurtleX,417-120,634-355-TurtleX,437-120);
  line(673-355-TurtleX,419-120,660-355-TurtleX,439-120);
  line(634-355-TurtleX,438-120,660-355-TurtleX,439-120);
  line(634-355-TurtleX,438-120,618-355-TurtleX,464-120);
  line(660-355-TurtleX,439-120,676-355-TurtleX,464-120);
  
  
  
   //face
  noStroke();
  fill(#D9D9D9);
  ellipse(440+width/2-TurtleX,height-70-120,43,38);
  //body
  ellipse(485+width/2-TurtleX,height-72-120,67,53);
  //shell
  fill(#58A1CA);
  arc(948-TurtleX,465-120,109,104,PI,TWO_PI);
  fill(255);
  rect(985-TurtleX,748-120,142,16);
  //eye
  fill(0);
  rect(428+width/2-TurtleX,height-75-120,9,12);
  fill(#D9D9D9);
  rect(908-TurtleX,467-120,4,8);
  //pattern
  stroke(0);
  strokeWeight(1);
  line(924-TurtleX,417-120,934-TurtleX,437-120);
  line(973-TurtleX,419-120,960-TurtleX,439-120);
  line(934-TurtleX,438-120,960-TurtleX,439-120);
  line(934-TurtleX,438-120,918-TurtleX,464-120);
  line(960-TurtleX,439-120,976-TurtleX,464-120);
}