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
Slider d; 
Cursor p;
int timer = 0;
PImage photo;
int streak = 0;

ArrayList<Displayable> thingsToDisplay;
ArrayList<Circle> circles;
ArrayList<Slider> sliders;
ArrayList<Object> dead;

void setup() {
  size(1000, 800);
  thingsToDisplay = new ArrayList<Displayable>();
  circles = new ArrayList<Circle>();
  sliders = new ArrayList<Slider>();
  dead = new ArrayList<Object>();
  a = new Circle(100, 400, 80, 1);
  thingsToDisplay.add(a);
  circles.add(a);
  b = new Circle(250, 480, 80, 2);
  circles.add(b);
  c = new Circle(400, 600, 80, 3);
  circles.add(c);
  d = new Slider(550, 600, 80, 4, 150, 300);
  sliders.add(d);
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
  timer++;
  a.display();
  if (timer > 50) b.display();
  if (timer > 100) c.display();
  
  if (timer > 150) d.display();
  
  p.display();
  for( Circle c : circles){
    if (c.isClicked() == true && dead.contains(c)== false) dead.add(c);;
  }
  for( Slider s : sliders){
    if (s.isClicked() == true && dead.contains(s)== false) dead.add(s);;
  }
  textSize(32);
  fill(255);
  text("Streak:" + dead.size() + "x", 15, 790);
  print(d.accuracy());
}