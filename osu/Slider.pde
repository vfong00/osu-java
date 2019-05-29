class Slider extends Circle implements Displayable{
  float x, y, r, in, score, start, end, len, startTime;
  String num;
  boolean dead, wasClicked;
  ApproachCircle c;
  
  public Slider(float x, float y, float r, float startTime, int num, float len) {
    super(x,y,r,startTime,num);
    this.x = x;
    this.y = y;
    this.r = r;
    this.num =  "" + num;
    c = new ApproachCircle(x, y, 2.5 * r);
    
    start = x;
    end = x + len;
    
    dead = false;
    wasClicked = false;

    score = 2.5;
    this.len = len;
  }
  
  void displayClicky(boolean gradient) {
    noStroke();
    fill(255);
    ellipse(x, y, r, r);
    if (gradient) {
      drawLinearGradientDisc(x, y, (r/2) - 5, (r/2) - 5, color(204, 44, 113), color(20,20,20));
      fill(255);
      text(num, x-12, y+5);
    }
  }
  
  void display() {
    if (!isDead()) {
      horizontalSlider();
      if (c.getRadius() < r) {
        fill(255);
        text("hello", 50, 160);
        if (x < end) x++;
        else dead = true;
        displayClicky(false);
      } else {
        if (isClicked() || wasClicked) {
          wasClicked = true;
        } else {
          c.display();
          displayClicky(true);
        }
      }
    }
    
    //if (g < elapseTime) {
    //  horizontalSlider();
    //  if (!isDead()) {
    //    if (c.getRadius() >= r) c.display();
    //    else dead = true;
    //    noStroke();
    //    fill(255);
    //    ellipse(x,y,r,r);
        
    //    drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
    //    fill(255);
    //    text(num, x-12, y+5);
    //    in++;
    //  } else {
    //    // if (c.getRadius() < r) {  
    //      if(x < end) x++;
    //      noStroke();
    //      fill(255);
    //      ellipse(x,y,r,r);
    //      drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
    //      if (mousePressed && dist(mouseX, mouseY, this.x, this.y) < r) in++;  
    //    // }
    //  }
    //}
    // text(accuracy() + "", 50, 160);
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
    //if (!dead){
    //  clicked = dist(mouseX, mouseY, this.x, this.y) < r && mousePressed;
    //  if (clicked) {
    //    initialAcc();
    //  }
    //  // dead = clicked;
    //}
    return dead;
  }
  boolean initialAcc() {
    return (c.getRadius() / r) < 1.95;
  }
  
}
