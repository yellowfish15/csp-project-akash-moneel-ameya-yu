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
float gravConstant = 0.5;
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
  mercury = loadImage("mercurymap.jpg");
  uranus = loadImage("uranusmap.jpg");
  mars = loadImage("marsmap.jpg");
  background(stars);
  frameRate(60);
  
  objs = new ArrayList();
  objs.add(new GravObject(new PVector(377.58392,474.42743,0.0),1.0,16.0, new PVector(5.0674562,-5.8845067,0.0), mercury));
  objs.add(new GravObject(new PVector(612.4747,515.1686,0.0),1.0,16.0, new PVector(-5.841165,5.2759438,0.0), venus));
  objs.add(new GravObject(new PVector(539.5281,721.4221,0.0),1.0,16.0, new PVector(-3.0426807,4.4249387,0.0), earth));
  objs.add(new GravObject(new PVector(586.6104,640.1573,0.0), 1.0,16.0, new PVector(6.4177895,-2.2694788,0.0), mars));
  objs.add(new GravObject(new PVector(242.3743,754.4275,0.0), 1.0,16.0, new PVector(-2.5125985,-1.9869404,0.0), jupiter));
  objs.add(new GravObject(new PVector(456.50778,636.6375), 1.0,16.0, new PVector(-8.793516,0.80103785,0.0), saturn));
  objs.add(new GravObject(new PVector(449.0483,761.3675,0.0), 1.0,16.0, new PVector(-4.8299937,-0.080984056,0.0), uranus));
  objs.add(new GravObject(new PVector(283.71255,476.51636,0.0), 1.0,16.0, new PVector(-2.4048367,-5.5439234,0.0),neptune));
  objs.add(new FixedObject(new PVector(500.0,500.0,0.0), 20000.0,40.0, sun));

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
