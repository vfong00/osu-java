class Slider extends Circle implements Displayable{
  float x, y, r, in, score, start, end, len, startTime;
  String num;
  boolean dead, wasClicked, inRangeOfTick;
  int firstNotTicked;
  ApproachCircle c;
  int time;
  boolean complete;
  boolean reverse;
  SliderTick[] ticks;
  
  public Slider(float x, float y, float r, int num, float len, int startTime, boolean reverse){
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
    complete = false;

    score = 2.5;
    this.len = len;
    this.time = startTime;
    this.reverse = reverse;
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
    for (int i = firstNotTicked; i < ticks.length; i++) {
      ticks[i].display();
    }
    if (ticks[firstNotTicked].isTicked() || !ticks[firstNotTicked].isAlive()) firstNotTicked++;
  }
  
  void checkTicked() {
    if (dist(x, y, ticks[firstNotTicked].getX(), ticks[firstNotTicked].getY()) < r) {
      inRangeOfTick = true;
      if (mousePressed) ticks[firstNotTicked].setTicked(true);
    } else {
      if (inRangeOfTick) {
        inRangeOfTick = false;
        ticks[firstNotTicked].setAlive(false);
      }
    }
  }
  
  void display() {
    if (!isDead()) {
      horizontalSlider();
      displayTicks();
      if (c.getRadius() < r) {
        fill(255);
        if (x < end && !complete){
          x++;
        }else{
          complete = true;
          if (!reverse)  dead = true;
        }
      }
        checkTicked();
        displayClicky(false);
        if (complete && reverse){
          if (x > start) x--;
          else dead = true;
        }
      } else {
        if (isClicked() || wasClicked) {
          c.updateRadius();
          wasClicked = true;
        } else {
          c.display();
          displayClicky(true);
        }
      }
      text(firstNotTicked + "", 50, 160);
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