import processing.opengl.*;

Circle a; 
Circle b; 
Circle c; 
Slider d; 
Cursor p;
int timer = 0;
PImage photo;
int streak = 0;
int score = 0;
int rawScore = 0;
float accuracy = 0;

ArrayList<Object> clickies;
ArrayList<Circle> circles;
ArrayList<Slider> sliders;
ArrayList<Object> dead;

void setup() {
  size(1000, 800);
  clickies = new ArrayList<Object>();
  circles = new ArrayList<Circle>();
  sliders = new ArrayList<Slider>();
  dead = new ArrayList<Object>();
  a = new Circle(100, 400, 80, 0, 1);
  clickies.add(a);
  circles.add(a);
  b = new Circle(250, 480, 80, 50, 2);
  clickies.add(b);
  circles.add(b);
  c = new Circle(400, 600, 80, 100, 3);
  clickies.add(c);
  circles.add(c);
  d = new Slider(550, 600, 80, 150, 4, 150, 300);
  clickies.add(d);
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
  
  for( Circle c : circles){
    if (timer > c.getStartTime()) c.display();
    if ((c.isDead() || c.isClicked()) && !dead.contains(c)) {
      int cScore = c.getScore();
      if (cScore == 0) streak = 0;
      else streak++;
      int sMult = streak;
      if (sMult > 0) sMult--;
      score += cScore + (cScore * sMult);
      rawScore += cScore;
      dead.add(c);
    }
  }
  for( Slider s : sliders){
    if (timer > s.getStartTime()) s.display();
    if (s.isClicked() && !dead.contains(s)) {
      int sScore = s.getScore();
      if (sScore == 0) streak = 0;
      else streak++;
      int sMult = streak;
      if (sMult > 0) sMult--;
      score += sScore + (sScore * sMult);
      rawScore += sScore;
      dead.add(s);
    }
  }
  p.display();
  
  accuracy = (float) rawScore / (3 * dead.size());
  if (dead.size() == 0) accuracy = 0;
  textSize(32);
  fill(255);
  text("Streak: " + streak + "x", 15, 790);
  text("Score: " + score, 820, 35); 
  text("Accuracy: " + accuracy + "%", 725, 65);
}
