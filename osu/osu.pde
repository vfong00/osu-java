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
  
  play();
  

  p = new Cursor(width / 2, height / 2);
}

void play(){
  pause = false;
  timer =0;
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

  sp = new Spinner(500, 800);
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

boolean pause;
void keyPressed() {
  final int k = keyCode;

  if (k == 'P' && screen.getMode() == 1)
    pause = !pause;

}



void pause(){
    if(pause){
      fill(166, 255, 43);
      rect(300,200,400,100);
      fill(255, 130, 28);
      rect(300,350,400,100);
      fill(255, 33, 73);
      rect(300,500,400,100);
      
      fill(10);
      noStroke();
      triangle(300,200,320,200,300,220);
      triangle(700,300,700,280,680,300);
      
      triangle(300,350,320,350,300,370);
      triangle(700,450,700,430,680,450);
      
      triangle(300,500,320,500,300,520);
      triangle(700,600,700,580,680,600);
      
      textSize(50);
      fill(255);
      text("Continue",390,265);
      text("Retry", 440,415);
      text("Back to Menu", 340,565);
      
      p.display();
      
      if (mousePressed && 300 < mouseX && mouseX < 700 && 200 < mouseY && mouseY < 300) pause = false;
      if (mousePressed && 300 < mouseX && mouseX < 700 && 350 < mouseY && mouseY < 450){
        play();
        screen.setMode(1);
      }
      if (mousePressed && 300 < mouseX && mouseX < 700 && 500 < mouseY && mouseY < 600){
        pause = false;
        screen.setMode(0);
        play();
      }
    }
}

void draw() { 
  background(10);
  noCursor();
  timer++;
  
  
  
  p.display();
  if (screen.getMode() == 0){
     
    screen.display();
     p.display();
  }else if(screen.getMode() == 1 && !pause){
    
    p.display();
    displayClickies();
    accuracy = (float) rawScore * 100 / rawMaxScore;
    if (dead.size() == 0) accuracy = 0;
    textSize(32);
    fill(255);
    // text(timer + "", 50, 160);
    text("Streak: " + streak + "x", 15, 790);
    text("Score: " + score, 800, 35);
    text("Accuracy: " + (int) (accuracy * 100) / 100.0  + "%", 725, 65);
  }
  pause();
  if (screen.getMode() == 2){
    
    screen.drawOptions();
    screen.drawCircle(325,400);
    pushStyle();
    //background darken
    fill(10,10,10,200);
    rect(0,0,1000,800);
    
    
    //help box
    fill(255);
    rect(240,190,520,420,15);
    //gradient
    for (int i = 210; i <= 590; i++) {
        float inter = map(i, 210, 590, 0, 1);
        color c = lerpColor( color(130, 28, 72),color(10), inter);
        stroke(c);
        line(260, i, 740, i);
    }
    
    //header
    textSize(50);
    text("Controls", 400,255);
    stroke(255);
    strokeWeight(7);
    line(395,265, 610,265);
    
    
    //key outlines
    stroke(255);
    strokeWeight(5);
    fill(20,20,20,0);
    rect(405,300,100,40,5);
    
    //actions
    textSize(40);
    fill(255);
    text("Play", 280,335);
    
    //keys
    textSize(30);
    text("Enter", 418,330);
    popStyle(); 
    p.display();
    
  }
  if (screen.getMode() == 3) exit();
}
