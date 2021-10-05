ArrayList<GravObject> objs;
float gravConstant = 40;
void setup() {
  size(1000, 1000);
  frameRate(60);

  objs = new ArrayList();

  float numRandObjs = 0;
  for (int i=0; i<numRandObjs; i++) {
    PVector pos = new PVector(random(width), random(height));
    float mass = random(10)+30;
    float size = mass/2;
    PVector vel = PVector.random2D();
    objs.add(new GravObject(pos, mass, size, vel));
  }

  objs.add(new FixedObject(new PVector(width/2, height/2), 100, 40));

  objs.add(new GravObject(new PVector(width/2, height/2-200), 10, 20, new PVector(4, 0)));
}

void draw() {
  update();

  background(0);
  for (GravObject obj : objs) {
    obj.draw();
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

  for (GravObject obj : objs) {
    obj.update();
  }
}
