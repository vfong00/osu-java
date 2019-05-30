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
- Wrote a clickable circle prototype.

### 5-20-19
- Wrote an approach circle that made the clickable circle disappear when the approach circle elapsed the clickable circle.

### 5-21-19
- Made basic accuracy/score calculations and printed them so it looks nice?!

### 5-22/23-19
- I died because of APs I am sorry

### 5-24-19
- Worked on integrating accuracy with Angel's stuff on sliders.

### weekend (5-25/26/27-19)
- Sort of successfully got accuracy working -- the problem is that the calculation works weird and I have to ask Angel about it since she wrote it.
- Put streaks in scoring
- Implemented streak snaps
- Tried implementing a cursor trail to no avail (that rhymes!)

### 5-28-19
- Reorganized a lot of code -- made it clean to read (no documentation yet). Especially needed on Slider since there were a lot of test variables.
- Based on discussion, rewrote slider based on ticks as opposed to timing completion:
- Ticks visually done except disappearing. No scoring work done.
- Finished cursor trail in concept but not working as intended.

### 5-29-19



## devlog - angel

### 5-20-19
- Made the display of the circles a linear gradient
- Adjustment of sensitivity for clickies 
- Added streak and counter number

### 5-21-19
- Modified the way we count dead and scored clickies and made counters
- Made a slider do the slide (took FOREVER and I didn't commit different parts because I have bad committing habits)

### 5-22/23-19
- Modified the motion of the horizontal slider
- Began  and finished accuracy calculation

### 5-24-19
- Began working on slider reverse 

### weekend (5-25/26/27-19)
- I got sick and died :(

### 5-28-19
- Continued to work on reverse slider (diff branch)
- I keep falling alseep and not pushing and having technical issues (my computer is like, barely functional)

### 5-29-19
- Merged the code from Vincent's score calculation developments and ticks and began implementing old code but it got very confusing and complicated so there weren't enough commits 
