class Circle {
  float x,y;
  boolean clicked;
  
  public Circle(float x, float y) {
    this.x = x;
    this.y = y;
    clicked = false;
  }
  
  void display() {
    if (!isClicked()) circle(x,y,25.0);
  }
  
  boolean isClicked() {
    if (!clicked) clicked = dist(mouseX, mouseY, this.x, this.y) < 25.0/2 && mousePressed;
    return clicked;
  }
}

Circle c; 

void setup() {
  size(1000, 800);
  c = new Circle(400,400);
}

void draw() { 
  background(255);
  c.display();
}
