import processing.opengl.*;


class Circle implements Displayable {
  float x, y, r, score, startTime, timeDispScore;
  String num;
  boolean dead;
  boolean clicked;
  ApproachCircle c;
  
  public Circle(float x, float y, float r, float startTime, int num) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.num =  "" + num;
    this.startTime = startTime;
    
    dead = false;
    clicked = false;
    score = 2.5;
    timeDispScore = 255;
    c = new ApproachCircle(x, y, 2.5 * r);
  }
  
  void displayScore(float xcor, float ycor) {
    String dispText = "";
    if (getScore() == 300) {
      fill(0, 255, 255, timeDispScore);
      dispText= "300";
    } else if (getScore() == 100) {
      fill(127, 255, 0, timeDispScore);
      dispText = "100";
    } else if (getScore() == 50) {
      fill(160, 32, 240, timeDispScore);
      dispText = "50";
    } else { 
      fill(255, 0, 0, timeDispScore);
      dispText = "X";
    }
    textSize(25);
    text(dispText, xcor + 10, ycor + 10);
    timeDispScore -= 2;
    textSize(32);
  }
  
  void display() {
    if (!isDead()) {
      if (c.getRadius() >= r) c.display();
      else dead = true;
      noStroke();
      fill(255);
      ellipse(x,y,r,r);
      
      drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
      //fill(20);
      //ellipse(x,y,r - (r / 10),r - (r / 10));
      fill(255);
      text(num, x-10, y+10);
    } else {
      if (timeDispScore > 0) {
        displayScore(x, y);
      }
    }
  }
  
   float h = random(0, 360);

  void drawLinearGradientDisc( float x, float y, float radiusX, float radiusY, int fromC, int toC){ 
    noStroke(); 
    beginShape(TRIANGLE_STRIP);
    int halfC = lerpColor(fromC,toC,0.5);
    
    for(float theta=0; theta<TWO_PI; theta+=TWO_PI/36){ 
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
  
  float getStartTime(){
    return startTime;
  }
  
  boolean isClicked(){
    return clicked;
  }
  
  boolean isDead() {
    if (!dead){
      clicked = dist(mouseX, mouseY, this.x, this.y) < r && mousePressed;
      if (clicked) {
        score = c.getRadius() / r;
      }
      dead = clicked;
    }
    return dead;
  }
  
  int getScore() {
    if (score < 1.25) return 300;
    else if (score < 1.6) return 100;
    else if (score < 1.95) return 50;
    return 0;
  }
}
