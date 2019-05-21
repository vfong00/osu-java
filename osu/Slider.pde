class Slider extends Circle implements Displayable{
  float x,y,r;
  int num; 
  float len; 
  
  public Slider(float x, float y, float r, int num){
    super(x,y,r,num);
    
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