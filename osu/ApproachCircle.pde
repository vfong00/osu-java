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
    fill(0,0,0,0);
    stroke(204, 44, 113, 255);
    strokeWeight(2.5);
    ellipse(x,y,r,r);
    r -= 0.75;
  }
}
