class Slider extends Circle implements Displayable{
  float x,y,r,in,score,start,end,len,startTime;
  String num;
  boolean dead,clicked;
  ApproachCircle c;
  int elapseTime;
  
  public Slider(float x, float y, float r, float startTime, int num, float len, int elapseTime){
    super(x,y,r,startTime,num);
    this.x = x;
    this.y = y;
    this.r = r;
    this.num =  "" + num;
    start = x;
    dead = false;
    clicked = false;
    score = 2.5;
    this.len = len;
    this.elapseTime = elapseTime;
    end = x + len;
    c = new ApproachCircle(x, y, 2.5 * r);
  }
  
  int g = 0;
  void display(){
    if ( g < elapseTime){
      horizontalSlider();
      if (!isDead()) {
        if (c.getRadius() >= r) c.display();
        else dead = true;
        noStroke();
        fill(255);
        ellipse(x,y,r,r);
        
        drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
        //fill(20);
        //ellipse(x,y,r - (r / 10),r - (r / 10));
        fill(255);
        text(num, x-12, y+5);
        in++;
      }else{
        if(x< (end)) x++;
        noStroke();
        fill(255);
        ellipse(x,y,r,r);
        drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
        if ((mousePressed && dist(mouseX, mouseY, this.x, this.y) < r)) in++;  
      }
    }
    
    g++;
  }

  
  float accuracy() {
    return (in) / (float) elapseTime;
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
 
  boolean isClicked(){
    return clicked;
  }
  
  boolean isDead() {
    if (!dead){
      clicked = dist(mouseX, mouseY, this.x, this.y) < r*(3/2) && mousePressed;
      if (clicked) {
        score = c.getRadius() / r;
      }
      dead = clicked;
    }
    return dead;
  }
  int getScore() {
    //if (score < 1.25) return 300;
    //else if (score < 1.6) return 100;
    //else if (score < 1.95) return 50;
    //return 0;
    if (accuracy() > (7 / 10.0)) return 300;
    else if (accuracy() > (2 / 5.0)) return 100;
    else if (accuracy() > (1 / 5.0)) return 50;
    else return 0;
  }
  
}
