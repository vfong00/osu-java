class SliderTick extends Thing implements Displayable {
  boolean ticked;
  
  SliderTick(float x, float y) {
    super(x, y);
    ticked = false;
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
}
