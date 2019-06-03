class ApproachCircle implements Displayable {
  float x, y, r;
  
  public ApproachCircle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  // return current radius of the shrinking approach circle
  float getRadius() {
    return r;
  }
  
  // upon call, shrinks the approach circle
  void updateRadius() {
    r -= 1.5;
  }
  
  void display() {
    fill(0,0,0,0);
    stroke(204, 44, 113, 255);
    strokeWeight(2.5);
    ellipse(x,y,r,r);
    updateRadius();
  }
}
