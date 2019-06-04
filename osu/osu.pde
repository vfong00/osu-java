import processing.opengl.*;
import java.util.*;

int timer = 0;
int streak = 0;
int score = 0;
int rawScore = 0;
int rawMaxScore = 0;
float accuracy = 0;

StartScreen screen;

Circle a;
Circle b;
Circle c;
Slider d;
Spinner sp;
Cursor p;
Slider j;

ArrayList<Object> clickies;
ArrayList<Circle> circles;
ArrayList<Slider> sliders;
ArrayList<Object> dead;

void setup() {
  size(1000, 800);
  screen = new StartScreen(1000,800);

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

  //d = new Slider(550, 600, 900, 600, 80, 150, 4, true);
  //clickies.add(d);
  //sliders.add(d);

  //j = new Slider(550, 250, 900, 170, 80, 150, 5, false);
  //clickies.add(j);
  //sliders.add(j);

  sp = new Spinner(0, 100000, 25);

  p = new Cursor(width / 2, height / 2);
}

void scoreCircle(Circle circle) {
  int cScore = circle.getScore();
  if (cScore == 0) streak = 0;
  else streak++;
  int sMult = streak;
  if (sMult > 0) sMult--;
  score += cScore + (cScore * sMult);
  rawScore += cScore;
  rawMaxScore += 300;
}

void scoreSlider(Slider slider) {
  // if slider hasn't been clicked or if the approach circle hasn't elapsed it yet
  if (slider.notChecked()) {
    // check for when elapsed
    if (slider.moving()) {
      slider.setNotChecked(false);
      streak = 0;
    }
    // check for when clicked first time. Update scores
    else if (slider.wasClicked()) {
      slider.setNotChecked(false);
      if (slider.initScore() > 1.6) streak = 0;
      else streak++;
    }
  }
  // check if on tick, and score appropiately
  if (!slider.isDead() && slider.onTick()) {
    score += 10;
    if (slider.tickScore() == 10) streak++;
    else if (slider.tickScore() == 0 && !slider.lastTicked()) streak = 0;
  }
  // when slider ends, calculate the end score based on the amount of ticks ticked and add it.
  if (slider.isDead() && !dead.contains(slider)) {
    int sScore = slider.getScore();
    int sMult = streak;
    if (sMult > 0) sMult--;
    score += sScore + (sScore * sMult);
    rawScore += sScore;
    rawMaxScore += 300;
  }
}


void displayClickies() {
  // display all circles. When dead, score them.
  textSize(32);
  for(Circle c : circles){
    if (timer > c.getStartTime()) c.display();
    if ((c.isDead() || c.isClicked()) && !dead.contains(c)) {
      scoreCircle(c);
      dead.add(c);
    }
  }
  // display all sliders. Score them (for each tick) until they die)
  for(Slider s : sliders){
    if (timer > s.getStartTime()) s.display();
    scoreSlider(s);
    if (s.isDead() && !dead.contains(s)) {
      dead.add(s);
    }
  }
  if (timer > sp.getStartTime() && timer < sp.getEndTime()) sp.display();
}




void draw() {
  background(20);
  noCursor();
  if (screen.getMode() == 0) {
    screen.display();
    p.display();
  } else if(screen.getMode() == 1) {
    timer++;
    displayClickies();
    accuracy = (float) rawScore * 100 / rawMaxScore;
    if (dead.size() == 0) accuracy = 0;
    fill(255);
    p.display();

    // text(timer + "", 50, 160);
    textSize(32);
    text("Streak: " + streak + "x", 15, 790);
    text("Score: " + score, 800, 35);
    text("Accuracy: " + (int) (accuracy * 100) / 100.0  + "%", 725, 65);
  }

}
