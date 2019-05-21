import processing.opengl.*;


class Circle {
  float x,y,r;
  String num;
  boolean dead;
  ApproachCircle c;
  
  public Circle(float x, float y, float r, String num) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.num = num;
    dead = false;
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
      text(num, x, y);
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


  boolean isDead() {
    if (!dead) dead = dist(mouseX, mouseY, this.x, this.y) < 40.0/2 && mousePressed;
    return dead;
  }
}

class Cursor {
  float x, y;
  PImage photo;
  public Cursor(float x, float y, PImage photo) {
      this.x = x;
      this.y = y;
      this.photo = photo;
  }
  void display() {
    imageMode(CENTER);
    image(photo, mouseX, mouseY);
  }
    
}

class ApproachCircle {
  float x, y, r;
  public ApproachCircle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  float getRadius() {
    return r;
  }
  
  void display() {
    fill(255);
    ellipse(x,y,r,r);
    noStroke();
    fill(20);
    ellipse(x,y,r - 1, r - 1);
    r -= 0.75;
  }
}

Circle a; 
Circle b; 
Circle c; 
Circle d; 
Cursor p;
PImage photo;

void setup() {
  size(1000, 800);
  a = new Circle(400, 400, 80, "1");
  //b = new Circle(500, 480, 80, "2");
  //c = new Circle(600, 600, 80, "3");
  //d = new Circle(700, 600, 80, "4");
  photo = loadImage("cursor@2x.png");
  photo.resize(40,40);
  p = new Cursor(width / 2, height / 2, photo);
}

void circles(){
  a.display();
  /*delay(10);
  b.display();
  delay(40);
  c.display();
  delay(10);
  d.display();*/
}
void draw() { 
  background(20);
  noCursor();
  circles();
  p.display();
  
 
}
