class Slider extends Circle implements Displayable{
  float x, y, r, in, score, start, end, len, startTime;
  String num;
  boolean dead, wasClicked, lastTicked;
  int firstNotTicked;
  ApproachCircle c;
  SliderTick[] ticks;
  
  public Slider(float x, float y, float r, float startTime, int num, float len) {
    super(x,y,r,startTime,num);
    this.x = x;
    this.y = y;
    this.r = r;
    this.num =  "" + num;
    firstNotTicked = 0;
    
    c = new ApproachCircle(x, y, 2.5 * r);
    ticks = new SliderTick[3];
    ticks[0] = new SliderTick(650, 600, false);
    ticks[1] = new SliderTick(750, 600, false);
    ticks[2] = new SliderTick(850, 600, true);
    
    start = x;
    end = x + len;
    
    dead = false;
    wasClicked = false;
    lastTicked = false;

    score = 2.5;
    this.len = len;
  }
  
  void displayClicky(boolean number) {
    noStroke();
    fill(255);
    ellipse(x, y, r, r);
    drawLinearGradientDisc(x, y, (r/2) - 5, (r/2) - 5, color(204, 44, 113), color(20,20,20));
    if (number) {
      fill(255);
      text(num, x-12, y+5);
    }
  }
  
  void displayTicks() {
    for (int i = 0; i < ticks.length; i++) {
      ticks[i].display();
    }
  }
  
  void checkTicked() {
    text(firstNotTicked, 50, 160);
    SliderTick tick = ticks[firstNotTicked];
    if (x == tick.getX() && y == tick.getY()) {
      if (mousePressed) {
        tick.setTicked(true);
      } else {
        tick.setAlive(false);
      }
      firstNotTicked++;
      lastTicked = tick.isEnd();
    }
  }
  
  void display() {
    if (!isDead()) {
      horizontalSlider();
      displayTicks();
      if (c.getRadius() < r) {
        fill(255);
        if (x < end) x++;
        else dead = true;
        if (!lastTicked) checkTicked();
        displayClicky(false);
      } else {
        if (isClicked() || wasClicked) {
          c.updateRadius();
          wasClicked = true;
        } else {
          c.display();
          displayClicky(true);
        }
      }
    }
  }
  
  void horizontalSlider(){
    fill(0,0,0,0);
    stroke(255, 255);
    strokeWeight(4);
    line(start, y-r/2, end, y-r/2);
    line(start, y+r/2, end, y+r/2);
    arc(start, y , r, r, PI / 2, 3 * PI / 2);
    arc(end,  y ,r, r, 3 * PI / 2, 2*PI);
    arc(end, y , r, r, 0, PI / 2);
  }
 
  boolean isClicked() {
    return (mousePressed && dist(mouseX, mouseY, this.x, this.y) < r);
  }
  
  boolean isDead() {
    return dead;
  }
  boolean initialAcc() {
    return (c.getRadius() / r) < 1.95;
  }
  
}
