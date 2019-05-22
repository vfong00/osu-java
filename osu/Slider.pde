class Slider extends Circle implements Displayable{
  float x,y,r;
  String num;
  boolean dead;
  boolean clicked;
  int score;
  ApproachCircle c;
  int len;
  
  public Slider(float x, float y, float r, int num, int len){
    super(x,y,r,num);
    dead = false;
    clicked = false;
    score = 0;
    c = new ApproachCircle(x, y, 2.5 * r);
  }
  
  void display(){
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
      for(int i = 0; i <= len; i++){
         drawLinearGradientDisc(x+i,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
      }
    }
  }
 
  boolean isDead() {
    if (!dead){
      clicked = dist(mouseX, mouseY, this.x, this.y) < r && mousePressed;
      dead = clicked;
    }
    return dead;
  }
  
}
