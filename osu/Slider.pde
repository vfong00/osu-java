class Slider extends Circle implements Displayable{
  float x, y, x1, y1, r, in, score, len, startTime, initScore, timeDispScore;
  String num;
  boolean dead, wasClicked, lastTicked, onTick, notChecked, moving, reverse, complete;
  int firstNotTicked, numTicked, tickScore, shape;
  ApproachCircle c;
  SliderTick[] ticks, reverseTicks;
  PVector start, end, dir;

  public Slider(float x, float y, float x1, float y1, float r, float startTime, int num, boolean reverse) {
    super(x, y, r, startTime, num);

    this.x = x;
    this.y = y;
    start = new PVector(x,y);

    this.x1 = x1;
    this.y1 = y1;
    end = new PVector(x1,y1);

    len = dist(start.x, start.y, end.x, end.y);
    dir = new PVector(x1 - x, y1 - y);

    this.r = r;
    this.reverse = reverse;
    this.num =  "" + num;
    
    firstNotTicked = 0;
    numTicked = 0;
    initScore = 2.5;
    timeDispScore = 255;

    c = new ApproachCircle(x, y, 2.5 * r);
    this.len = dist(start.x,start.y,x1,y1);
    print(len);


    if (reverse) {
      ticks = new SliderTick[6];
      /*for(int i = 1; i < ticks.length/2; i++){
        ticks[i] = new SliderTick(start.x + 75 + i*100, start.y, false);
      }
      for(int i = ticks.length/2; i < ticks.length -1; i++){
        ticks[i] = new SliderTick((end-75)-(i-3)*100, 600, false);
      }*/
      ticks[0] = new SliderTick(625, 600, false);
      ticks[1] = new SliderTick(725, 600, false);
      ticks[2] = new SliderTick(825, 600, false);
      ticks[3] = new SliderTick(825, 600, false);
      ticks[4] = new SliderTick(725, 600, false);
      ticks[5] = new SliderTick(625, 600, true);
    } else {
      ticks = new SliderTick[3];
      ticks[0] = new SliderTick(start.x + 80, y + dir.normalize().y * 90, false);
      ticks[1] = new SliderTick(start.x + 80 +100, y+ dir.normalize().y * 190, false);
      ticks[2] = new SliderTick(start.x + 80 + 200, y + dir.normalize().y * 290, true);
    }

    dead = false;
    wasClicked = false;

    lastTicked = false;
    onTick = false;
    notChecked = true;
    complete = false;
    moving = false;

    score = 2.5;
    this.reverse = reverse;
  }


  void displayClicky(boolean number){
    stroke(255);
    strokeWeight(4);
    fill(20);
    ellipse(x,y,r-7,r-7);
 //<>//
    drawLinearGradientDisc(x, y, (r/2) - 5, (r/2) - 5, color(204, 44, 113), color(20,20,20));
    if (number){
      fill(255);
      text(num, x-12, y+5);
    }
  }

  void displayTicks(SliderTick[] g) {
      if (!reverse) {
        for (int i = 0; i < g.length; i++) {
          g[i].display();
        }
      } else {
        if (complete) {
          for (int i = 0; i < g.length; i++) {
            g[i].display();
          }
        } else {
          for (int i = 0; i < g.length/2; i++) {
            g[i].display();
          }
        }
      }
  }

  void checkTicked(SliderTick[] g){
    SliderTick tick = g[firstNotTicked];
    if (dist(x,y, tick.getX(), tick.getY()) < r/4) {
      onTick = true;
      if (isClicked()) {
        tickScore = 10;
        numTicked++;
        tick.setTicked(true);
      } else {
        tickScore = 0;
        tick.setAlive(false);
      }
      firstNotTicked++;
      lastTicked = tick.isEnd();
    } else {
      onTick = false;
    }
  }

  void drawSlider(){
    PVector n = new PVector(10, 0);
    float angle = PVector.angleBetween(n,dir);
    fill(0,0,0,0);
    stroke(255, 255);
    strokeWeight(4);

    line(start.x - (r/2)*cos(PI/2-angle), start.y-(r/2)*sin(PI/2-angle), end.x- (r/2)*cos(PI/2-angle), end.y-(r/2)*sin(PI/2-angle)); //top
    line(start.x - (r/2)*cos(PI/2+angle), start.y+(r/2)*sin(PI/2+angle), end.x - (r/2)*cos(PI/2+angle), end.y+(r/2)*sin(PI/2+angle)); //bottom
    arc(start.x, start.y, r, r,  PI/2-angle, 3 * PI / 2 - angle);
    arc(end.x, end.y, r, r, 3 * (PI / 2 )- angle , 2*PI);
    arc(end.x, end.y, r, r, 0, PI/2-angle);
    noStroke();
    fill(20);
  }
  
  void funcSlider() {
    if (c.getRadius() < r) {
        moving = true;
        fill(255);
        if (!complete && (end.x - x > 1 || end.y - y > 1 )){
          x += dir.normalize().x * 2;
          y += dir.normalize().y * 2;
        } else {
           if (!reverse) {
             dead = true;
           } else {
             complete = true;
             if (x > start.x) x -= dir.normalize().x ;
           }
        }
        if (!lastTicked) checkTicked(ticks);
        else onTick = false;
        displayClicky(false);
      } else {
        if (wasClicked || isClicked()) {
          if (!wasClicked) initScore = c.getRadius() / r;
          c.updateRadius();
          wasClicked = true;
        } else {
          c.display();
          displayClicky(true);
        }
      }
  }

  boolean isClicked() {
    return (mousePressed && dist(mouseX, mouseY, this.x, this.y) < r);
  }

  boolean wasClicked() {
    return wasClicked;
  }

  boolean isDead() {
    return dead;
  }

  boolean lastTicked() {
    return lastTicked;
  }

  boolean onTick() {
    return onTick;
  }

  boolean notChecked() {
    return notChecked;
  }

  boolean moving() {
    return moving;
  }

  void setNotChecked(boolean b) {
    notChecked = b;
  }

  float initScore() {
    return initScore;
  }

  int getScore() {
    // initial hit score; -1 and 0 are used for later tiering
    if (initScore() > 1.6) score = -1;
    else score = 0;

    // final calculation of ticks ticked to total number of ticks
    if (((float) numTicked / ticks.length) == 1.0) score += 3;
    else if (((float) numTicked / ticks.length) >= 0.5) score += 2;
    else if (((float) numTicked / ticks.length) > 0) score++;

    // conversion to 300/100/50/X system
    if (score == 3) score = 300;
    else if (score == 2) score = 100;
    else if (score == 1) score = 50;
    else score = 0;

    return (int) score;
  }

  int tickScore() {
    return tickScore;
  }
  
  void display() {
    if (!isDead()) {
      drawSlider();
      displayTicks(ticks);
      funcSlider();
    } else {
      if (timeDispScore > 0) {
        if (reverse) displayScore(x + 5, y + 5);
        else displayScore(x1 + 5, y1 + 5);
      }
    }
  }
}

// make sure this works right
