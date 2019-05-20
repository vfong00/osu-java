class Circle {
  float x,y,r;
  boolean clicked;
  ApproachCircle c;
  
  public Circle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    clicked = false;
    c = new ApproachCircle(x, y);
  }
  
  void display() {
    if (!isClicked()){
      fill(255);
      ellipse(x,y,r,r);
      noStroke();
      fill(20);
      ellipse(x,y,r - (r / 10),r - (r / 10));
    }
  }
  
  boolean isClicked() {
    if (!clicked) clicked = dist(mouseX, mouseY, this.x, this.y) < 25.0/2 && mousePressed;
    return clicked;
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
    
    
  }
}

Circle c; 
Cursor p;
PImage photo;

void setup() {
  size(1000, 800);
  c = new Circle(400, 400, 50);
  photo = loadImage("cursor@2x.png");
  photo.resize(40,40);
  p = new Cursor(width / 2, height / 2, photo);
}

void draw() { 
  background(20);
  noCursor();
  c.display();
  p.display();
}
