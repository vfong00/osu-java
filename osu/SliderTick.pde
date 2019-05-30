class SliderTick extends Thing implements Displayable {
  boolean end, ticked, alive;
  
  SliderTick(float x, float y, boolean end) {
    super(x, y);
    this.end = end;
    ticked = false;
    alive = true;
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, 10, 10);
    fill(0);
    ellipse(x, y, 5, 5);
  }
  
  boolean isTicked() {
    return ticked;
  }
  
  boolean isAlive() {
    return alive;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return x;
  }
  
  void setTicked(boolean t) {
    ticked = t;
  }
  
  void setAlive(boolean a) {
    alive = a;
  }
}
