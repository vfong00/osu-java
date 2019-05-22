class Slider extends Circle implements Displayable{
  float x,y,r;
  String num;
  boolean dead;
  boolean clicked;
  int score;
  float start;
  float end;
  ApproachCircle c;
  float len;
  
  public Slider(float x, float y, float r, int num, float len){
    super(x,y,r,num);
    this.x = x;
    this.y = y;
    this.r = r;
    start = x;
    this.num =  "" + num;
    dead = false;
    clicked = false;
    score = 0;
    this.len = len;
    end = x + len;
    c = new ApproachCircle(x, y, 2.5 * r);
  }
  
  void display(){
    slidershape();
    if (!isDead()) {
      if (c.getRadius() >= r) c.display();
      else dead = true;
      fill(255);
      ellipse(x,y,r,r);
      
      drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
      //fill(20);
      //ellipse(x,y,r - (r / 10),r - (r / 10));
      fill(255);
      text(num, x-12, y+5);
    }else{
      if(x< (end)) x++;
      fill(255);
      ellipse(x,y,r,r);
      drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
    }
  }
  
  
  void slidershape(){
    fill(0,0,0,0);
    stroke(255, 255);
    strokeWeight(4);
    line(start, y-r/2, end, y-r/2);
    line(start, y+r/2, end, y+r/2);
    arc(start, y , r, r, PI / 2, 3 * PI / 2);
    arc(end,  y ,r, r, 3 * PI / 2, 2*PI);
    arc(end, y , r, r, 0, PI / 2);
  }
 
  boolean isDead() {
    if (!dead){
      clicked = dist(mouseX, mouseY, this.x, this.y) < r && mousePressed;
      dead = clicked;
    }
    return dead;
  }
  
}
