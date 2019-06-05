# osu! in processing - Final Project for MKS22X

## What is this thing?
This is an attempt to recreate osu! (and similar derivatives of the game) <br/>
Here's the wiki page: https://en.wikipedia.org/wiki/Osu! <br/>
And for more information, use the game's own info page: https://osu.ppy.sh/help/wiki/Game_Modes/osu! <br/>
TL;DR Clicker rhythm game. <br/>
This game currently features:
- Clickable circles that disappear upon being clicked OR when the approach circle is on the circle.
- Sliders that slide. They do so when being clicked (regardless of timing) or when the approach circle hits the object.
- Spinners that you need to spin rapidly to clear
- Streak counting
- Accuracy and score counters
- Score integrated for all objects
- Cool textures
- An actual main menu???

## But like, how do you even start the game?
You'll need Processing!
Simply open osu.pde, and press the play button!

## devlog
### weekend (5-18/19-19)
[V] Wrote a clickable circle prototype. <br/>

### 5-20-19
[V] Wrote an approach circle that made the clickable circle disappear when the approach circle elapsed the clickable circle.<br/>
[A] Made the display of the circles a linear gradient <br/>
[A] Adjustment of sensitivity for clickies <br/>
[A] Added streak and counter number <br/>

### 5-21-19
[V] Made basic accuracy/score calculations and printed them so it looks nice?! <br/>
[A] Modified the way we count dead and scored clickies and made counters <br/>
[A] Made a slider do the slide (took FOREVER and I didn't commit different parts because I have bad committing habits) <br/>

### 5-22/23-19
[V] I died because of APs I am sorry <br/>
[A] Modified the motion of the horizontal slider <br/>
[A] Made a method for sliders that calculates accuracy <br/>

### 5-24-19
[V] Worked on integrating accuracy with Angel's stuff on sliders. <br/>
[A] Worked on sliders and their display as well as steak <br/>

### weekend (5-25/26/27-19)
[V] Sort of successfully got accuracy working -- the problem is that the calculation works weird and I have to ask Angel about it since she wrote it. <br/>
[V] Put streaks in scoring <br/>
[V] Implemented streak snaps <br/>
[V] Tried implementing a cursor trail to no avail (that rhymes!) <br/>
[A] I got sick and died :( <br/>

### 5-28-19
[V] Reorganized a lot of code -- made it clean to read (no documentation yet). Especially needed on Slider since there were a lot of test variables. <br/>
[V] Based on discussion, rewrote slider based on ticks as opposed to timing completion <br/>
[V] Ticks visually done except disappearing. No scoring work done. <br/>
[V] Finished cursor trail in concept but not working as intended. <br/>
[A] Continued to work on reverse slider (diff branch) <br/>
[A] I keep falling asleep and not pushing (and then having to stash my changes becuase of merging) and having technical issues (my computer is like, barely functional) <br/>

### 5-29-19
[V] Made ticks disappear upon the circle passing it. <br/>
[V] Did some preemptive work for scoring (counting held ticks), nothing apparent <br/>
[A] Merged the code from Vincent's score calculation developments and ticks and began implementing old code but it got very confusing and complicated so there weren't enough commits because not much coding just thinking<br/>

### 5-30-19
[V] Added ticks to the score officially <br/>
[V] Made scoring for slider object as a whole <br/>
[A] Converting code to be modular per usage and havea good functioning display <br/>
[A] Fixed errors with ticks on horizontal sliders <br/>
[A] Began implementing vectors in sliders <br/>
[A] Fixed reverse ticks <br/>

### 5-31-19
[V] Wrote general code to display score for each object (and it fades!!! pretty!!!) <br/>
[V] Finally got cursor trail to work (and it also fades!!! pretty!!!) <br/>
[A] Worked on integrating the sliders to operate on vectors rather than set coordinates<br/>

### 6-1-19
[V] Made game speed modular(ish) <br/>
[V] Messed with cursor to give visual cues to being clicked <br/>
[A] Less commits this time because spent a long time doing math to figure out the right angle coordinates to make the sldier display correctly at an angle given the start and end coordinates <br/>
[A] Fixed a different bug with the ticks, made it a formula rather than set coordinates <br/>
[A] Changed the way that ticks are scored for tilted sliders <br/>
[A] Spent like hours doing trigonometry on paper trying to figure out the coordinates for tilted parallel 180 sliders <br />

### 6-2-19
[V] so like food (that I technically helped make so my fault ig) made me real sick and I didn't commit anything. But I did the math on a piece of paper for a spinner. Yay psuedocode! <br/>
[A] Continued with the slider display <br />
[A] Did more math on paper for the slider <br />
[A] Made a start screen<br />

### 6-3-19
[V] Wrote spinner that spins with the cursor based on its angle change (and has a little decay/acceleration like in game) <br/>
[V] Visually represented that spinning <br/>
[A] Made a main menu with options but only tied it to the play button <br />
[A] Changed the way the gradient looks so it's smoother <br />

### 6-4-19
[V] Integrated score with spinners </br>
[V] Made them spin better visually </br>
[A] Made in-game controls like pause, restart and exit as buttons and key presses. <br />
[A] Made the exit and help menu with icons and explanations for in-game controls <br />
[A] Edited and changed the image we use for cursor and its trail <br />
[A] Made the end-game window that displays the score and calculates the grade <br />

