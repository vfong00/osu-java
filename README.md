# osu! in processing - Final Project for MKS22X

## What is this thing?
This is an attempt to recreate osu! (and similar derivatives of the game) <br/>
Here's the wiki page: https://en.wikipedia.org/wiki/Osu! <br/>
And for more information, use the game's own info page: https://osu.ppy.sh/help/wiki/Game_Modes/osu! <br/>
TL;DR Clicker rhythm game. <br/>
This game currently features:
- Clickable circles that disappear upon being clicked OR when the approach circle is on the circle.
- Sliders that slide. They do so when being clicked (regardless of timing) or when the approach circle hits the object.
- Streak counting
- Accuracy and score counters
- Cool textures

## But like, how do you even start the game?
You'll need Processing!
Simply open osu.pde, and press the play button!

## devlog - vincent
### weekend (5-18/19-19)
[V] Wrote a clickable circle prototype.

### 5-20-19
[V] Wrote an approach circle that made the clickable circle disappear when the approach circle elapsed the clickable circle.
[A] Made the display of the circles a linear gradient
[A] Adjustment of sensitivity for clickies
[A] Added streak and counter number

### 5-21-19
[V] Made basic accuracy/score calculations and printed them so it looks nice?!
[A] Modified the way we count dead and scored clickies and made counters
[A] Made a slider do the slide (took FOREVER and I didn't commit different parts because I have bad committing habits)

### 5-22/23-19
[V] I died because of APs I am sorry
[A] Modified the motion of the horizontal slider

### 5-24-19
[V] Worked on integrating accuracy with Angel's stuff on sliders.

### weekend (5-25/26/27-19)
[V] Sort of successfully got accuracy working -- the problem is that the calculation works weird and I have to ask Angel about it since she wrote it.
[V] Put streaks in scoring
[V] Implemented streak snaps
[V] Tried implementing a cursor trail to no avail (that rhymes!)
[A] I got sick and died :(

### 5-28-19
[V] Reorganized a lot of code -- made it clean to read (no documentation yet). Especially needed on Slider since there were a lot of test variables.
[V] Based on discussion, rewrote slider based on ticks as opposed to timing completion:
[V] Ticks visually done except disappearing. No scoring work done.
[V] Finished cursor trail in concept but not working as intended.
[A] Continued to work on reverse slider (diff branch)
[A] I keep falling asleep and not pushing and having technical issues (my computer is like, barely functional)

### 5-29-19
[V] Made ticks disappear upon the circle passing it.
[V] Did some preemptive work for scoring (counting held ticks), nothing apparent
[A] Merged the code from Vincent's score calculation developments and ticks and began implementing old code but it got very confusing and complicated so there weren't enough commits

### 5-30-19
[V] Added ticks to the score officially
[V] Made scoring for slider object as a whole
