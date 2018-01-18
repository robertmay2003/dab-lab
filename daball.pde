
Float g;
Float ang;
Integer xcoord;
Integer ycoord;
Integer startx;
Integer starty;
Integer time;
Float xv;
Float yv;
Integer xdir;
Integer ydir;
Integer ytest;
Integer xtest;
color wall;
color bouncy;
int[] tests = new int[9];
Integer timeStopped;
PImage goal;

void setup() {
  size(1024, 600);
  goal = loadImage("images/flagpost.png");
  g = 120.0;
  time = 1;
  xv = 17.0;
  yv = -6.0;
  xdir = 1;
  wall = -16776961;
  bouncy = -16711936;
  xcoord = 150;
  ycoord = 50;
  timeStopped = 0;
  fill(wall);
  rect(0, 0, width, height);
  fill(bouncy);
  rect(10, 590, width-20, 10);
  fill(0);
  rect(10, 10, width-20, height-20);
 }
 
 boolean in(int[] array, int val) {
   for (int i = 0; i < array.length; i++) {
     if (array[i] == val) return true;
   }
   return false;
 }
   
void genWalls(){
  fill(wall);
  rect(0, 0, 10, height);
  rect(0, 0, width, 10);
  rect(1014, 0, 10, height);
  rect(0, 590, width, 10);
}

void setGoal(int x, int y, float scale, int platwidth) {
  image(goal, x, y - goal.height/scale, goal.width/scale, goal.height/scale); 
  fill(#ff0000);
  rect(x-((platwidth / 2) - (goal.width / (2 * scale))), y, platwidth, 10);
}

void genLevel1() {
  fill(bouncy);
  rect(512, 0, 10, 200);
  rect(550, 490, 170, 100); 
  fill(wall);
  rect(512, 500, 512, 100);
  rect(0, 100, 200, 560);
  rect(743, 300, 281, 550);
  noStroke();
  setGoal(810, 300, 2.3, 150);
  genWalls();
}

void moveBall(){
  time += 1;
  yv += (g/1000);
  if (yv >= 0) {
    ydir = -1;
    ytest = 9;
  } else {
    ydir = 1;
    ytest = -9;
  }
  if (xv > 0) {
    xtest = 9;
  } else {
    xtest = -9;
  }
  if (xv == 0.0) {
    timeStopped += 1;
  }
  tests[0] = get(xcoord + xtest, ycoord);
  tests[1] = get(xcoord + xtest + xdir, ycoord);
  tests[2] = get(xcoord + xtest + (2 * xdir), ycoord); 
  tests[3] = get(xcoord + xtest + (3 * xdir), ycoord);
  tests[4] = get(xcoord + xtest + (4 * xdir), ycoord);
  tests[5] = get(xcoord + xtest + (5 * xdir), ycoord);
  tests[6] = get(xcoord + xtest + (6 * xdir), ycoord);
  tests[7] = get(xcoord + xtest + (7 * xdir), ycoord);
  tests[8] = get(xcoord + xtest + (8 * xdir), ycoord);
  if (in(tests, wall)) {
    xdir *= -1;
    xv *= -0.6;
  } else if (in(tests, bouncy)) {
    xdir *= -1;
    xv *= -1.3;
  }
  tests[0] = get(xcoord, ycoord + ytest);
  tests[1] = get(xcoord, ycoord + ytest + ydir);
  tests[2] = get(xcoord, ycoord + ytest + (2 * ydir)); 
  tests[3] = get(xcoord, ycoord + ytest + (3 * ydir));
  tests[4] = get(xcoord, ycoord + ytest + (4 * ydir));
  tests[5] = get(xcoord, ycoord + ytest + (5 * ydir));
  tests[6] = get(xcoord, ycoord + ytest + (6 * ydir));
  tests[7] = get(xcoord, ycoord + ytest + (7 * ydir));
  tests[8] = get(xcoord, ycoord + ytest + (8 * ydir));
  if (in(tests, wall)) {
    ydir *= -1;
    yv *= -0.6;
    xv *= 0.9;
  } else if (in(tests, bouncy)) {
    ydir *= -1;
    yv *= -0.9;
    yv += -1.3;
    xv *= 0.9;
  }
  if (abs(xv) < 0.1) {
    xv = 0.0;
  }
  if ((ycoord > 1024) || (timeStopped > 400)) {
    time = 0;
    yv = -6.0;
    ycoord = 300;
    xcoord = 300;
    xv = 17.0;
    timeStopped = 0;
    fill(0);
    rect(0, 0, width, height);
  }
  ycoord += int(yv);
  xcoord += int(xv);
  fill(0, 70);
  rect(0, 0, width, height);
  noStroke();
  fill(0, 100);
  rect(0, 0, 200, 40);
  genLevel1();
  fill(255);
  text(str(xcoord) + " " + str(ycoord) + " " + str(xv), 30, 30);
  ellipse(xcoord, ycoord, 15, 15);
  noStroke();
}

void draw() {
  //time += 1;
  //yv += (g/1000);
  //if (yv >= 0) {
  //  ydir = -1;
  //  ytest = 9;
  //} else {
  //  ydir = 1;
  //  ytest = -9;
  //}
  //if (xv > 0) {
  //  xtest = 9;
  //} else {
  //  xtest = -9;
  //}
  //if (xv == 0.0) {
  //  timeStopped += 1;
  //}
  //tests[0] = get(xcoord + xtest, ycoord);
  //tests[1] = get(xcoord + xtest + xdir, ycoord);
  //tests[2] = get(xcoord + xtest + (2 * xdir), ycoord); 
  //tests[3] = get(xcoord + xtest + (3 * xdir), ycoord);
  //tests[4] = get(xcoord + xtest + (4 * xdir), ycoord);
  //tests[5] = get(xcoord + xtest + (5 * xdir), ycoord);
  //tests[6] = get(xcoord + xtest + (6 * xdir), ycoord);
  //tests[7] = get(xcoord + xtest + (7 * xdir), ycoord);
  //tests[8] = get(xcoord + xtest + (8 * xdir), ycoord);
  //if (in(tests, wall)) {
  //  xdir *= -1;
  //  xv *= -0.6;
  //} else if (in(tests, bouncy)) {
  //  xdir *= -1;
  //  xv *= -1.3;
  //}
  //tests[0] = get(xcoord, ycoord + ytest);
  //tests[1] = get(xcoord, ycoord + ytest + ydir);
  //tests[2] = get(xcoord, ycoord + ytest + (2 * ydir)); 
  //tests[3] = get(xcoord, ycoord + ytest + (3 * ydir));
  //tests[4] = get(xcoord, ycoord + ytest + (4 * ydir));
  //tests[5] = get(xcoord, ycoord + ytest + (5 * ydir));
  //tests[6] = get(xcoord, ycoord + ytest + (6 * ydir));
  //tests[7] = get(xcoord, ycoord + ytest + (7 * ydir));
  //tests[8] = get(xcoord, ycoord + ytest + (8 * ydir));
  //if (in(tests, wall)) {
  //  ydir *= -1;
  //  yv *= -0.6;
  //  xv *= 0.9;
  //} else if (in(tests, bouncy)) {
  //  ydir *= -1;
  //  yv *= -0.9;
  //  yv += -1.3;
  //  xv *= 0.9;
  //}
  //if (abs(xv) < 0.1) {
  //  xv = 0.0;
  //}
  //if ((ycoord > 1024) || (timeStopped > 400)) {
  //  time = 0;
  //  yv = -6.0;
  //  ycoord = 300;
  //  xcoord = 300;
  //  xv = 17.0;
  //  timeStopped = 0;
  //  fill(0);
  //  rect(0, 0, width, height);
  //}
  //ycoord += int(yv);
  //xcoord += int(xv);
  //fill(0, 12);
  //rect(0, 0, width, height);
  //noStroke();
  //fill(0, 100);
  //rect(0, 0, 200, 40);
  //genLevel1();
  //fill(255);
  //text(str(xcoord) + " " + str(ycoord) + " " + str(xv), 30, 30);
  //ellipse(xcoord, ycoord, 15, 15);
  //noStroke();
  moveBall();
}