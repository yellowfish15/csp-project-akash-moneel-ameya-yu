/*
 * Created by: Akash Joseph, Moneel Patel, Ameya Purao, Yu Lim
 * Mrs. Castillo, Period 1 Computer Science Principles Project
 *
 * Simulate gravity on 2D objects and display to screen.
 *
 */

import java.util.*;

ArrayList<GravObject> objs; // Stores all planets including fixed planets
float gravConstant = 0.5; // Strength of gravitational attraction
PImage starBg;

boolean screenWrap = false; // Enables/disables object screen wrap
float worldMargin = 100; // Bounds for when objects are destroyed off-screen

PVector mPos; // Temporary position for creating planet
FixedObject mDisp; // Planet display
float defMass=1, defSize=16, velMult=50; // Default parameters

float defFMass = 5000, defFSize = 25; // central object attributes

String saveFile = "solar system"; 

// to determine whether increase/decrease mass is valid
boolean isLeftClicked = false; 

boolean isSandbox = false;

void setup1() {
  size(1000, 1000); // Initializes window size, framerate, and colormode
  frameRate(60);
  colorMode(HSB);

  starBg = loadImage("starbg3.jpg"); // Loads in background

  objs = new ArrayList();
  objs.add(new FixedObject(new PVector(width/2, height/2), 20000, 40));
}

// When mouse is pressed, it starts drawing a new planet and enables path prediction
void mousePressed1() {
  if (mouseButton == LEFT) {
    mPos = new PVector(mouseX, mouseY);
    objs.remove(mDisp);
    mDisp = new FixedObject(mPos, 0, defSize+sqrt(defMass));
    objs.add(mDisp);
    isLeftClicked = true;
  }
  if(mouseButton == RIGHT) {
    objs.add(new FixedObject(new PVector(mouseX, mouseY), defFMass, defFSize));
  }
}

// When mouse is released, it creates the new planet and adds it to the list of planets
void mouseReleased1() {
  if (mouseButton == LEFT) {
    PVector vel = PVector.sub(mPos, new PVector(mouseX, mouseY));
    vel.div(velMult);
    objs.remove(mDisp);
    GravObject obj = new GravObject(mPos, defMass, defSize+sqrt(defMass), vel);
    obj.col = mDisp.col;
    objs.add(obj);
    isLeftClicked = false;
    defMass = 1;
  }
}

// Display method (called from solarSystem2D
void draw1() {
  update1();

  background(starBg);
  for (GravObject obj : objs) {
    obj.draw();
  }

  // draw the mouse velocity and trajectory of grav_object
  if (mousePressed && mouseButton == LEFT) {
    mDisp.size = defSize+sqrt(defMass);
    
    // display mouse velocity
    PVector vel = PVector.sub(mPos, new PVector(mouseX, mouseY));
    vel.div(velMult);
    textSize(25);
    text((floor(vel.mag()*100)+0.0)/100+" m/s, " + defMass + " kg", mouseX, mouseY);

    // display trajectory of grav_object (1090 frames into the future)

    GravObject trace = new GravObject(mPos.copy(), defMass, 3, vel, mDisp.col);
    ArrayList<GravObject> predList = new ArrayList();
    for (GravObject o : objs) {
      predList.add(o.clone());
    }
    predList.add(trace);
    for (int l = 0; l < 1000; l++) { 

      for (int i=0; i<predList.size()-1; i++) {
        GravObject obj1 = predList.get(i);
        for (int k=i+1; k<predList.size(); k++) {
          GravObject obj2 = predList.get(k);
          PVector base = PVector.sub(obj1.pos, obj2.pos);
          float dist = base.magSq();
          dist = max(dist, 400); // prevents infinite acceleration
          dist = gravConstant/dist;
          base = base.normalize().mult(dist);
          obj2.applyForce(PVector.mult(base, obj1.mass));
          obj1.applyForce(PVector.mult(base, -obj2.mass));
        }
      }

      for (int i = predList.size()-1; i>=0; i--) {
        GravObject obj = predList.get(i);
        obj.update();
      }

      trace.draw();
    }
  }
}

void update1() {

  // simulate gravity influence on each GravObject
  for (int i=0; i<objs.size()-1; i++) {
    GravObject obj1 = objs.get(i);
    for (int k=i+1; k<objs.size(); k++) {
      GravObject obj2 = objs.get(k);
      PVector base = PVector.sub(obj1.pos, obj2.pos);
      float dist = base.magSq();
      dist = max(dist, 400); // prevents infinite acceleration
      dist = gravConstant/dist;
      base = base.normalize().mult(dist);
      obj2.applyForce(PVector.mult(base, obj1.mass));
      obj1.applyForce(PVector.mult(base, -obj2.mass));
    }
  }

  // update each GravObject attribute
  for (int i = objs.size()-1; i>=0; i--) {
    GravObject obj = objs.get(i);
    obj.update();
  }
}

void keyPressed() {
  //if (key == 'p') {
  //  writeToFile(saveFile+".dat");
  //}

  if (isSandbox && key == 'o') {
    objs = new ArrayList();
    objs.add(new FixedObject(new PVector(width/2, height/2), 20000, 40));
  }

  //if (key == 'i') {
  //  objs = readFromFile(saveFile+".dat");
  //}
  
  // if user is currently about to add a new GravObject
  if(isLeftClicked) {
    if(keyCode == DOWN) { // decrease GravObj mass
      if(defMass > 1) {
        defMass -= 1;
      }
    } else if(keyCode == UP) { // decrease GravObj mass
       defMass += 1;
    }
  }
  
  // Press m to go to main menu
  if(key == 'm'){
    gameState = 0;
  }
}
