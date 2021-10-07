import queasycam.*;

//PeasyCam cam;
QueasyCam cam;

PImage jupiter;
PImage earth;
PImage sun;
PImage mercury; 
PImage venus;
PImage mars;
PImage saturn;
PImage uranus;
PImage neptune;
PImage stars;

ArrayList<GravObject> objs;
float gravConstant = 40;
void setup(){
  size(1000,1000,P3D);
  
  cam = new QueasyCam(this);
  perspective(PI/3,width/height,0.01,10000); 
  cam.speed = 5;
  cam.sensitivity = 0.5;
  
  jupiter = loadImage("jupitermap.jpg");
  earth = loadImage("earthmap1k.jpg");
  stars = loadImage("starbg2.jpg");
  sun = loadImage("sunmap.jpg");
  venus = loadImage("venusmap.jpg");
  saturn = loadImage("saturnmap.jpg");
  mercury = loadImage("mercury.jpg");
  uranus = loadImage("uranusmap.jpg");
  mars = loadImage("marsmap.jpg");
  background(stars);
  frameRate(60);
  
  objs = new ArrayList();
  objs.add(new GravObject(new PVector(100,100,100), 10, new PVector(2, 1, -3), mercury));
  objs.add(new GravObject(new PVector(100,100,100), 27, new PVector(2, 1, -3), venus));
  objs.add(new GravObject(new PVector(100,100,100),30, new PVector(2, 1, -3), earth));
  objs.add(new GravObject(new PVector(100,100,100), 20, new PVector(2, 1, -3), mars));
  objs.add(new GravObject(new PVector(100,100,100), 330, new PVector(2, 1, -3), jupiter));
  objs.add(new GravObject(new PVector(100,100,100), 270, new PVector(2, 1, -3), saturn));
  objs.add(new GravObject(new PVector(100,100,100), 120, new PVector(2, 1, -3), uranus));
  objs.add(new GravObject(new PVector(100,100,100), 115, new PVector(2, 1, -3),neptune));
  objs.add(new GravObject(new PVector(0,0,0),1000, new PVector(2, 1, -3), sun));



}

void draw(){
  update();
  
  background(stars);
  lights();
  noCursor();
  for(GravObject obj : objs){
    obj.draw();
  }
}

void update(){
  
  for(int i=0; i<objs.size()-1; i++){
    GravObject obj1 = objs.get(i);
    for(int k=i+1; k<objs.size(); k++){
      GravObject obj2 = objs.get(k);
      PVector base = PVector.sub(obj1.pos, obj2.pos);
      float dist = gravConstant/base.magSq();
      base = base.normalize().mult(dist);
      obj2.applyForce(PVector.mult(base, obj1.mass));
      obj1.applyForce(PVector.mult(base, -obj2.mass));
    }
  }
  
  for(GravObject obj : objs){
    obj.update();
  }
}
