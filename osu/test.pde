class test{
  
  float x, y, x1, y1, r;
  float[] start = new float[2];
  float[] end = new float[2];
  PVector g;

  test(float x, float y, float x1, float y1, float r) {
    this.x = x;
    this.y = y;
    start[0] = x;
    start[1] = y;
    
    this.x1 = x1;
    this.y1 = y1;
    end[0] = x1;
    end[1] = y1; 
    
    this.r = r;
    g = new PVector(x1- x,y1-y);
    //g = new PVector(end[0]-start[0],end[1]-start[1]);
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x,y,r,r);
    drawLinearGradientDisc(x,y, r/2 - 5, r/2 - 5, color(204, 44, 113), color(20,20,20));
    if(abs(y1-y) > 1){
      x += g.normalize().x ;
      y += g.normalize().y ;
    }
  }
  
  
  
  void drawLinearGradientDisc( float x, float y, float radiusX, float radiusY, int fromC, int toC){ 
    noStroke(); 
    beginShape(TRIANGLE_STRIP);
    int halfC = lerpColor(fromC,toC,0.5);
    
    for(float theta=0; theta<TWO_PI; theta+=TWO_PI/36){ 
      fill(halfC);  
      vertex(x,y);
      if ( theta <= PI )
      fill(lerpColor(fromC, toC, (theta%PI)/PI ));
      else
      fill(lerpColor(toC, fromC, (theta%PI)/PI ));
      vertex(x+radiusX*cos(theta),y+radiusY*sin(theta));
    } 
    endShape(); 
  }
}
