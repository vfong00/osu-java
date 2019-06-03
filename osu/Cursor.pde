class Cursor extends Thing implements Displayable {
  float x, y;
  PImage cursorPhoto, cursorTrailPhoto;
  ArrayDeque<CursorTrail> trailImgs;
  
  public Cursor(float x, float y) {
      super(x,y);
      cursorPhoto = loadImage("Images/cursor@2x.png");
      cursorPhoto.resize(40,40);
      cursorTrailPhoto = loadImage("Images/cursortrail@2x.png");
      cursorTrailPhoto.resize(40,40);
      // queue of cursor trails, which gradually become transparent as they go towards the end of the queue.
      trailImgs = new ArrayDeque<CursorTrail>(41);
  }
  
  void display() {
    imageMode(CENTER);
    x = mouseX;
    y = mouseY;
    
    // add a new trail at the current mouse spot
    CursorTrail t = new CursorTrail(x, y, cursorTrailPhoto);
    trailImgs.add(t);
    
    // iterate to display each trail image
    Iterator<CursorTrail> iter = trailImgs.descendingIterator();
    while (iter.hasNext()) {
      iter.next().display();
    }
    
    // keeping 40 trail images constantly
    if (trailImgs.size() >= 40) {
      trailImgs.removeFirst();
    }
    
    // dilation of cursor
    if (mousePressed) cursorPhoto.resize(60,60);
    else cursorPhoto.resize(40,40);
    
    tint(255, 255);
    image(cursorPhoto, x, y);
    fill(255);
    
    text(x+"", 50, 70);
    text(y+"", 50, 100);
    text(mousePressed+"", 50, 130);
  }
}
