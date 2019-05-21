interface Displayable {
  void display();
}

class Thing{
  float x, y;

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
} 

class Cursor extends Thing implements Displayable{
  float x, y;
  PImage photo;
  public Cursor(float x, float y, PImage photo) {
      super(x,y);
      this.photo = photo;
  }
  void display() {
    imageMode(CENTER);
    image(photo, mouseX, mouseY);
  }
    
}


Circle a; 
Circle b; 
Circle c; 
Circle d; 
Cursor p;
PImage photo;
int streak = 0;

ArrayList<Displayable> thingsToDisplay;
ArrayList<Circle> circles;
ArrayList<Circle> dead;

void setup() {
  size(1000, 800);
  thingsToDisplay = new ArrayList<Displayable>();
  circles = new ArrayList<Circle>();
  dead = new ArrayList<Circle>();
  a = new Circle(400, 400, 80, "1");
  thingsToDisplay.add(a);
  circles.add(a);
  //b = new Circle(500, 480, 80, "2");
  //c = new Circle(600, 600, 80, "3");
  //d = new Circle(700, 600, 80, "4");
  photo = loadImage("cursor@2x.png");
  photo.resize(40,40);
  p = new Cursor(width / 2, height / 2, photo);
}

void circles(){
  a.display();
  
  /*delay(10);
  b.display();
  delay(40);
  c.display();
  delay(10);
  d.display();*/
}
void draw() { 
  background(20);
  noCursor();
  
  a.display();
  p.display();
  for( Circle c : circles){
    if (c.isDead() == true && dead.contains(c)== false) dead.add(c);;
  }
  textSize(32);
  text("Streak:" + dead.size() + "x", 15, 790);
 
}
