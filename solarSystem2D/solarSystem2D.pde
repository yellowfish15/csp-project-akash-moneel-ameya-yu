int currentPic = 0;
PImage[] gif;
Button sandbox = new Button(300, 480, 400, 100, "Sandbox");
Button preloads = new Button(300, 680, 400, 100, "Preloads");

//Preloads
Button solarSystem = new Button(300, 150, 400, 100, "Solar System");
Button infinity = new Button(300, 350, 400, 100, "Infinity");
Button chaos = new Button(300, 550, 400, 100, "Chaos");
Button rose = new Button(300, 750, 400, 100, "Rose");

PFont font;
int gameState = 0;
// setup() and other global variables

void setup() {
  size(1000, 1000);
  textAlign(CENTER, CENTER);
  font = createFont("Death Star.otf", 75);
  textFont(font);
  gif = new PImage[12];
  int index = 0;
  while (index < 12) {
    gif[index] = loadImage("frame_0" + index + "_delay-0.11s.gif");
    index++;
  }
  frameRate(60);
}

void draw() {
  if (gameState == 0) {
    mainMenu();
  } else if (gameState == 1) {
    sandbox();
  } else if (gameState == 2) {
    preloads();
  }
}

void background() {
  image(gif[currentPic], 0, 0, 1000, 1000);
  currentPic++;   
  if (currentPic > 11) {
    currentPic = 0;
  }
}

void mainMenu() {
  background();
  fill(255);
  textFont(font);
  textAlign(CENTER, CENTER);
  text("2D SPACE VISUALIZER", 500, 200);
  sandbox.draw();
  preloads.draw();
}

void sandbox() {
  draw1();
}

//solar system, infinity, chaos, rose
void preloads() {
  background();

  solarSystem.draw();
  infinity.draw(); 
  chaos.draw(); 
  rose.draw();
}

void mouseReleased() {
  if (gameState == 0) {
    if (sandbox.clickedOn()) {
      gameState = 1;
      setup1();
    }

    if (preloads.clickedOn()) {
      gameState = 2;
    }
  } else if (gameState == 1) {
    mouseReleased1();
  } else if (gameState == 2) {
    if (solarSystem.clickedOn()) {
      setup1();
      objs=readFromFile("solar system.dat");
      gameState = 1;
    }
    if (infinity.clickedOn()) {
      setup1();
      objs=readFromFile("infinity.dat");
      gameState = 1;
    }
    if (chaos.clickedOn()) {
      setup1();
      objs=readFromFile("chaos.dat");
      gameState = 1;
    }
    if (rose.clickedOn()) {
      setup1();
      objs=readFromFile("rose.dat");
      gameState = 1;
    }
  }
}

void mousePressed() {
  if (gameState == 1) {
    mousePressed1();
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
