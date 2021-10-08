/*ArrayList<GravObject> objs;
float gravConstant = 40;
PVector mPos;
FixedObject mDisp;
float defMass=1, defSize=16, velMult=50;
PImage starBg;

boolean screenWrap = false;
float worldMargin = 100;

boolean mPressed = false;

void setup() {
  size(1000, 1000);
  frameRate(60);

  starBg = loadImage("starbg3.jpg");

  objs = new ArrayList();

  float numRandObjs = 0;
  for (int i=0; i<numRandObjs; i++) {
    PVector pos = new PVector(random(width), random(height));
    float mass = random(10)+30;
    float size = mass/2;
    PVector vel = PVector.random2D();
    objs.add(new GravObject(pos, mass, size, vel));
  }

  objs.add(new FixedObject(new PVector(width/2, height/2), 150, 40));

  objs.add(new GravObject(new PVector(width/2, height/2-200), 10, 20, new PVector(5, 0)));
}

void mousePressed() {
  mPos = new PVector(mouseX, mouseY);
  mDisp = new FixedObject(mPos, 0, defSize);
  objs.add(mDisp);
  mPressed = true;
}

void mouseReleased() {
  PVector vel = PVector.sub(mPos, new PVector(mouseX, mouseY));
  vel.div(velMult);
  objs.remove(mDisp);
  objs.add(new GravObject(mPos, defMass, defSize, vel));
  mPressed = false;
}

void draw() {
  update();

  background(starBg);
  for (GravObject obj : objs) {
    obj.draw();
  }
  
  // draw the mouse velocity
  if(mPressed) {
     PVector vel = PVector.sub(mPos, new PVector(mouseX, mouseY));
     vel.div(velMult);
     textSize(25);
     text((floor(vel.mag()*100)+0.0)/100+"", mouseX, mouseY); 
  }
}

void update() {

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

  for (int i = objs.size()-1; i>=0; i--) {
    GravObject obj = objs.get(i);
    obj.update();
  }
}
*/


final int MENUSCREEN = 0;
final int GAMESCREEN = 1;
int screenState;
// setup() and other global variables

void setup() {
  size(1000, 1000);
  screenState = 0;
  textAlign(CENTER);
  textSize(50); 
  text("2D GRAVITY VISUALIZER", 500, 250);
  PImage gif = loadImage("galaxy.gif");
}

void draw() {
  if (screenState == MENUSCREEN) {
    drawMenu();
  } else if (screenState == GAMESCREEN) {
    drawGame();
  } else {
    println("Something went wrong!");
  }
}

void drawGame() {
  // Pew, pew, I'm a game!
}

void drawMenu() {
  // Don't forget to save :D
}
