class SliderTick extends Thing implements Displayable {
  boolean ticked;
  
  SliderTick(float x, float y) {
    super(x, y);
    ticked = false;
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x,y,10,10);
  }
  
  boolean isTicked() {
    return ticked;
  }
}
