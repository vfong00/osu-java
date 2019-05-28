class Cursor extends Thing implements Displayable {
  float x, y;
  PImage cursorPhoto, cursorTrailPhoto;
  ArrayDeque<CursorTrail> trailImgs;
  
  public Cursor(float x, float y, PImage cursorPhoto, PImage cursorTrailPhoto) {
      super(x,y);
      this.cursorPhoto = cursorPhoto;
      this.cursorTrailPhoto = cursorTrailPhoto;
      trailImgs = new ArrayDeque<CursorTrail>(100);
  }
  
  void display() {
    imageMode(CENTER);
    tint(255, 255);
    image(cursorPhoto, mouseX, mouseY);
    fill(255);
    
    if (trailImgs.size() >= 100) {
      trailImgs.removeFirst();
    }
    CursorTrail t = new CursorTrail(x, y, cursorTrailPhoto);
    trailImgs.add(t);
    
    text(mouseX+"", 50, 70);
    text(mouseY+"", 50, 100);
    text(mousePressed+"", 130,100);
  }
}
