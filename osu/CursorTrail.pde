class CursorTrail extends Thing implements Displayable {
  float x, y, transparency;
  PImage photo;
  
  public CursorTrail(float x, float y, PImage photo) {
      super(x,y);
      this.photo = photo;
      transparency = 255;
  } 
  
  void display() {
    imageMode(CENTER);
    tint(255, transparency);
    image(photo, x, y);
    transparency -= 2.5;
    if (transparency < 0) transparency = 0;
  }
  
}
