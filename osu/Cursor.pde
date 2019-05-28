class Cursor extends Thing implements Displayable {
  float x, y;
  PImage photo;
  
  public Cursor(float x, float y, PImage photo) {
      super(x,y);
      this.photo = photo;
  }
  
  void display() {
    imageMode(CENTER);
    tint(255, 255);
    image(photo, mouseX, mouseY);
    fill(255);
    text(mouseX+"", 50, 70);
    text(mouseY+"", 50, 100);
    text(mousePressed+"", 130,100);
  }
}
