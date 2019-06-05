class StartScreen {
  float x,y,r;
  int mode;
  boolean start;
  
  public StartScreen(float len, float w){
    x = len/2;
    y = w/2;
    start = false;
  }
   
  void display() {
      drawCircle(x,y);
      if (dist(mouseX, mouseY, 500, 400) <= 330){
        x = 325;
        drawOptions();
        drawCircle(x,y);
        if (mousePressed && (570 < mouseX && x < 820) && (250 < mouseY && mouseY < 330)) {
          start = true;
          mode = 1;
        }
        if (mousePressed && (585 < mouseX && x < 820) && (350 < mouseY && mouseY < 430)) mode = 2;
        if (mousePressed && (570 < mouseX && x < 820) && (450 < mouseY && mouseY < 530)) mode = 3;
      }
      else x = 500;
  }
  
 int getMode(){
     return mode;
 }
 
 void drawOptions() {
   fill(190, 50, 120);
   ellipse(325,400,1150,1150);
   fill(10);
   rect(0,0,900,250);
   rect(0,540,900,260);
   rect(0,0,200,600);
   rect(0,330,1000,20);
   rect(0,430,1000,20);
   textSize(60);
   fill(255);
   text("Play", 650, 310);
   text("Help", 650, 410);
   text("Exit", 650, 510);
   drawIcons();
  }
  
  void drawIcons(){
    //play
    fill(255);
    ellipse(815,300,35,35);
    ellipse(850,275,40,40);
    strokeWeight(2);
    stroke(190, 50, 120);
    ellipse(815,300,28,28);
    strokeWeight(5);
    
    ellipse(849.9999699,275,30,30);
    fill(190, 50, 120);
    textSize(21);
    text("1",808,308);
    text("2",844,283);
    
    //options
    fill(255);
    strokeWeight(1.5);
    rect(825,360,30,30);
    rect(860,390,30,30);
    rect(828,363,25,25);
    rect(863,393,25,25);
    fill(190, 50, 120);
    strokeWeight(3);
    line(830,380,835,385);
    line(835,385,850,365);
    line(866,395,885,415);
    line(885,395,866,415);
    
    
    // exit
    fill(255);
    rect(805,460,40,55);
    strokeWeight(1.5);
    rect(810,465,30,48);
    ellipse(835,493,5,5);
  }
  
  void setMode(int a){
    mode = a;
  }
  
  void drawCircle(float x, float y){
    stroke(255);
    strokeWeight(20);
    fill(10);
    ellipse(x,y,500,500);
    pushMatrix();
    drawLinearGradientDisc(x,y, 240, 240, color(204, 44, 113), color(20,20,20));
    rotate(PI/2);
    
    popMatrix();
    
    fill(255);
    textSize(200);
    text("osu!", x-205, y+45);
  }
   
   
   void helpMenu(){
     screen.drawOptions();
    screen.drawCircle(325,400);
    pushStyle();
    //background darken
    fill(10,10,10,200);
    rect(0,0,1000,800);
    
    
    //help box
    fill(255);
    rect(240,190,520,420,15);
    //gradient
    for (int i = 210; i <= 590; i++) {
        float inter = map(i, 210, 590, 0, 1);
        color c = lerpColor( color(130, 28, 72),color(10), inter);
        stroke(c);
        line(260, i, 740, i);
    }
    
    //header
    textSize(50);
    text("Controls", 400,255);
    stroke(255);
    strokeWeight(7);
    line(395,265, 610,265);
    
    
    //key outlines
    stroke(255);
    strokeWeight(5);
    fill(20,20,20,0);
    rect(380,300,100,40,5); //play
    rect(625,300,60,40,5); //exit
    rect(400,370,40,40,5); //pause
    rect(660,370,40,40,5); //exit
    //rect(400,430,40,40,5); // click
    ellipse(400,450,50,50); // click
    image(pointer, 430,475,45,45);
  
    //button
    rect(470,530,70,40,5); 
    
    //actions
    textSize(35);
    fill(255);
    text("Play", 280,335);
    text("Exit", 530,335);
    text("Pause", 280, 400);
    text("Restart", 530,400);
    text("Click", 280,465);
    text("OK", 480, 563); //button
    
    //keys
    textSize(25);
    text("Enter", 400,330);
    text("Esc", 635, 330);
    text("P", 413, 400);
    text("R", 673, 400);
    //text("X", 413, 460);
    //text("or", 455, 460);
    text("1", 393, 458);

    popStyle(); 
    
   }
  
  void drawLinearGradientDisc( float x, float y, float radiusX, float radiusY, int fromC, int toC){ 
    noStroke(); 
    beginShape(TRIANGLE_STRIP);
    int halfC = lerpColor(fromC,toC,0.5);
    
    for(float theta=0; theta<TWO_PI; theta+=TWO_PI/108){ 
      fill(halfC);  
      vertex(x,y);
      if ( theta <= PI )
      fill(lerpColor(fromC, toC, (theta%PI)/PI ));
      else
      fill(lerpColor(toC, fromC, (theta%PI)/PI ));
      vertex(x+radiusX*cos(theta),y+radiusY*sin(theta));
    } 
    endShape(); 
    
  }
  
  boolean getStart() {
    return start;
  }
  
  void setStart() {
    start = false;
  }
}
