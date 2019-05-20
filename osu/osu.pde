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
      noStroke();
      fill(20);
      ellipse(x,y,r - (r / 10),r - (r / 10));
      fill(255);
      text(num, x, y);
    }
  }
  
  boolean isDead() {
    if (!dead) dead = dist(mouseX, mouseY, this.x, this.y) < 25.0/2 && mousePressed;
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

Circle c; 
Cursor p;
PImage photo;

void setup() {
  size(1000, 800);
  c = new Circle(400, 400, 80, "1");
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
