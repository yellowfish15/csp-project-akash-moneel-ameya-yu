GravObject obj1, obj2;
float gravConstant = 0.0005;
void setup(){
  size(720,720);
  background(0);
  frameRate(60);
  obj1 = new GravObject(100,100,5,new PVector(1,0));
  obj2 = new GravObject(500,500,10,new PVector(-1,0));
}

void draw(){
  update();
  
  background(0);
  obj1.draw();
  obj2.draw();
}

void update(){
  PVector dist = PVector.sub(obj1.pos, obj2.pos).mult(gravConstant);
  obj2.applyForce(PVector.mult(dist, obj1.mass));
  obj1.applyForce(PVector.mult(dist, -obj2.mass));
  
  obj1.update();
  obj2.update();
}
