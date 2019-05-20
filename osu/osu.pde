class Circle {
  float x,y;
  
  public Circle(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    circle(x,y,25.0);
  }
}

Circle c; 

void setup() {
  size(1000, 800);
  c = new Circle(400,400);
}

void draw() { 
  c.display();
}
