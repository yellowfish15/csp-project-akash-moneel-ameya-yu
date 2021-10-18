import queasycam.*;
/*
Names: Akash Joseph, Moneel Patel, Ameya Purao, Yu Lim
Date: 10/18/2021
*/
QueasyCam cam;

PImage jupiter; //initializing all Image objects representing individual planets
PImage earth;
PImage sun;
PImage mercury; 
PImage venus;
PImage mars;
PImage saturn;
PImage uranus;
PImage neptune;
PImage stars;
HashMap<String, PImage> planets; 
ArrayList<GravObject> objs;
float gravConstant = 0.5; //describes the strength of attraction between two objects with mass
void setup() {
  size(1000, 1000, P3D);// starting camera properties and backgroudn properties
  cam = new QueasyCam(this);
  perspective(PI/3, width/height, 0.01, 10000); 
  cam.speed = 3;
  cam.sensitivity = 0.5;
  cam.position = new PVector(400, 400, 0);
  jupiter = loadImage("jupitermap.jpg"); //loading in the images from jpgs stored in 'data' folder to PImage
  earth = loadImage("earthmap1k.jpg");
  stars = loadImage("starbg2.jpg");
  sun = loadImage("sunmap.jpg");
  venus = loadImage("venusmap.jpg");
  saturn = loadImage("saturnmap.jpg");
  mercury = loadImage("mercurymap.jpg");
  uranus = loadImage("uranusmap.jpg");
  mars = loadImage("marsmap.jpg");
  planets = new HashMap();
  planets.put("jupiter", jupiter); //adding each image to a HashMap for better organization
  planets.put("earth", earth);
  planets.put("sun", sun);
  planets.put("venus", venus);
  planets.put("saturn", saturn);
  planets.put("mercury", mercury );
  planets.put("uranus", uranus);
  planets.put("mars", mars);
  background(stars);
  frameRate(60);

  objs = new ArrayList();
  objs = readFromFile("objVals.txt"); //initial velocity and position parameters through text input conversion
}

void draw() {
  update(); //redrawing the objects after every frame

  background(stars);
  lights();
  noCursor();
  for (GravObject obj : objs) {
    obj.draw();
  }
}

void update() {
  // applying gravitational attraction
  for (int i=0; i<objs.size()-1; i++) {
    GravObject obj1 = objs.get(i); //each individual planet
    for (int k=i+1; k<objs.size(); k++) {
      GravObject obj2 = objs.get(k); //every other planet in relation to the one initialized above
      PVector base = PVector.sub(obj1.pos, obj2.pos);
      float dist = gravConstant/base.magSq(); 
      base = base.normalize().mult(dist);
      obj2.applyForce(PVector.mult(base, obj1.mass)); //the calculated force of each force of attraction is applied
      obj1.applyForce(PVector.mult(base, -obj2.mass));
    }
  }

  for (GravObject obj : objs) {
    obj.update();
  }
}
