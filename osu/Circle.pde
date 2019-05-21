import processing.opengl.*;


class Circle implements Displayable {
  float x,y,r;
  String num;
  boolean dead;
  boolean clicked;
  int score;
  ApproachCircle c;
  
  public Circle(float x, float y, float r, int num) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.num =  "" + num;
    dead = false;
    clicked = false;
    score = 0;
    c = new ApproachCircle(x, y, 2.5 * r);
  }
  
  void display() {
    if (!isDead()) {
      if (c.getRadius() >= r) c.display();
      else dead = true;
      fill(255);
      ellipse(x,y,r,r);
      
      drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
      //fill(20);
      //ellipse(x,y,r - (r / 10),r - (r / 10));
      fill(255);
      text(num, x-10, y+10);
    }
  }
  
   float h = random(0, 360);

void drawLinearGradientDisc( float x, float y, float radiusX, float radiusY, int fromC, int toC){ 
    noStroke(); 
    beginShape(TRIANGLE_STRIP);
    int halfC = lerpColor(fromC,toC,0.5);
    
    for(float theta=0; theta<TWO_PI; theta+=TWO_PI/36)
    { 
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

  boolean isClicked(){
    return clicked;
  }
  boolean isDead() {
<<<<<<< HEAD
    if (!dead) dead = dist(mouseX, mouseY, this.x, this.y) < r && mousePressed;
=======
    if (!dead){
      clicked = dist(mouseX, mouseY, this.x, this.y) < r && mousePressed;
      dead = clicked;
    }
>>>>>>> master
    return dead;
  }
}
