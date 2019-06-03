class StartScreen{
  float x,y,r;
  public StartScreen(float len, float w){
    x = len/2;
    y = w/2;
  }
  
  void display(){
    textSize(20);
    //text(mouseX+"", 900, 70);
    //text(mouseY+"", 900, 100);
    drawCircle(x,y);
    if(dist(mouseX, mouseY, 500, 400) <=  240){
      x = 325;
      drawOptions();
      drawCircle(x,y);
    }
    else x = 500;
   
  }
  
 void drawOptions(){
   fill(190, 50, 120);
   ellipse(325,400,1150,1150);
   fill(20);
   rect(0,0,900,250);
   rect(0,540,900,260);
   rect(0,0,200,600);
   rect(0,330,1000,20);
   rect(0,430,1000,20);
   textSize(60);
   fill(255);
   text("Play", 650, 310);
   text("Options", 630, 410);
   text("Exit", 650, 510);
  }
  
  void drawCircle(float x, float y){
    stroke(255);
    strokeWeight(20);
    fill(20);
    ellipse(x,y,500,500);
    pushMatrix();
    drawLinearGradientDisc(x,y, 240, 240, color(204, 44, 113), color(20,20,20));
    rotate(PI/2);
    
    popMatrix();
    
    fill(255);
    textSize(200);
    text("osu!", x-205, y+45);
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
  
}
