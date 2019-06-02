class Cursor extends Thing implements Displayable {
  float x, y;
  PImage cursorPhoto, cursorTrailPhoto;
  ArrayDeque<CursorTrail> trailImgs;
  
  public Cursor(float x, float y) {
      super(x,y);
      cursorPhoto = loadImage("cursor@2x.png");
      cursorPhoto.resize(40,40);
      cursorTrailPhoto = loadImage("cursortrail@2x.png");
      cursorTrailPhoto.resize(40,40);
      trailImgs = new ArrayDeque<CursorTrail>(40);
  }
  
  void display() {
    imageMode(CENTER);
    x = mouseX;
    y = mouseY;
    
    if (trailImgs.size() >= 100) {
      trailImgs.removeFirst();
    }
    CursorTrail t = new CursorTrail(x, y, cursorTrailPhoto);
    trailImgs.add(t);
    
    Iterator<CursorTrail> iter = trailImgs.descendingIterator();
    while (iter.hasNext()) {
      iter.next().display();
    }
    
    if (mousePressed) cursorPhoto.resize(60,60);
    else cursorPhoto.resize(40,40);
    
    tint(255, 255);
    image(cursorPhoto, x, y);
    fill(255);
    
    text(x+"", 50, 70);
    text(y+"", 50, 100);
    text(mousePressed+"", 50, 130);
    // text(trailImgs.size() + "", 50, 160);
  }
}
