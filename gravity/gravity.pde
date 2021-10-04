import peasy.*;
import queasycam.*;

//PeasyCam cam;
QueasyCam cam;

ArrayList<GravObject> objs;
float gravConstant = 40;
void setup(){
  size(720,720,P3D);
  
  cam = new QueasyCam(this);
  perspective(PI/3,width/height,0.01,10000); 
  cam.speed = 5;
  cam.sensitivity = 0.5;
  
  background(0);
  frameRate(60);
  
  objs = new ArrayList();
  objs.add(new GravObject(new PVector(100,100,100),30,new PVector(2,1,-3)));
  objs.add(new GravObject(new PVector(0,0,0),30,new PVector(0,0,0)));
  objs.add(new GravObject(new PVector(-100,100,100),30,new PVector(2,1,-3)));
}

void draw(){
  update();
  
  background(0);
  
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
