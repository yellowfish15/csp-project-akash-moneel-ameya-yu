import peasy.*;

PeasyCam cam;

GravObject obj1, obj2;
float gravConstant = 40;
void setup(){
  size(720,720,P3D);
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(5000);
  cam.lookAt(0,0,0);
  cam.setDistance(400);
  
  background(0);
  frameRate(60);
  obj1 = new GravObject(new PVector(0,0,0),30,new PVector(0,0,0));
  obj2 = new GravObject(new PVector(100,100,100),30,new PVector(2,1,-3));
}

void draw(){
  update();
  
  background(0);
  obj1.draw();
  obj2.draw();
}

void update(){
  PVector base = PVector.sub(obj1.pos, obj2.pos);
  float dist = gravConstant/base.magSq();
  base = base.normalize().mult(dist);
  obj2.applyForce(PVector.mult(base, obj1.mass));
  obj1.applyForce(PVector.mult(base, -obj2.mass));
  
  obj1.update();
  obj2.update();
}
