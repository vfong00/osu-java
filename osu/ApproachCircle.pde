class ApproachCircle implements Displayable {
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
