import processing.opengl.*;
import java.util.*;

Circle a; 
Circle b; 
Circle c; 
Slider d; 
Cursor p;
CursorTrail t;
int timer = 0;
int streak = 0;
int score = 0;
int rawScore = 0;
float accuracy = 0;
PImage cursorPhoto;
PImage cursorTrailPhoto;

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
  
  d = new Slider(550, 600, 80, 150, 4, 150);
  clickies.add(d);
  sliders.add(d);
  
  cursorPhoto = loadImage("cursor@2x.png");
  cursorPhoto.resize(40,40);
  cursorTrailPhoto = loadImage("cursortrail@2x.png");
  cursorTrailPhoto.resize(100,100);
  p = new Cursor(width / 2, height / 2, cursorPhoto, cursorTrailPhoto);

  // t = new CursorTrail(200, 200, cursorTrailPhoto);
}

void displayCircles(){
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
    if ((s.isDead() || s.isClicked()) && !dead.contains(s)) {
      int sScore = s.getScore();
      text(sScore + "", 50, 130);
      if (sScore == 0) streak = 0;
      else streak++;
      int sMult = streak;
      if (sMult > 0) sMult--;
      score += sScore + (sScore * sMult);
      rawScore += sScore;
      dead.add(s);
    }
  }
}

void draw() { 
  background(20);
  noCursor();
  timer++;
 
  displayCircles();
  p.display();
  // t.display();
  
  accuracy = (float) rawScore / (3 * dead.size());
  if (dead.size() == 0) accuracy = 0;
  textSize(32);
  fill(255);
  text("Streak: " + streak + "x", 15, 790);
  text("Score: " + score, 800, 35); 
  text("Accuracy: " + (int) (accuracy * 100) / 100.0  + "%", 725, 65);
}
