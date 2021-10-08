//class GravObject {
//  public PVector pos, vel, accel;
//  public float mass, size;
//  public color col;
//  public PShape shape;

//  public GravObject(PVector pos, float mass, float size, PVector vel) {
//    this.pos = pos;
//    accel = new PVector();
//    this.mass = mass;
//    this.size = size;
//    this.vel = vel;
//    colorMode(HSB);
//    col = color(random(255), 255, 255);
//  }

//  public void applyForce(PVector force) {
//    accel.add(force);
//  }

//  public void update() {
//    vel.add(accel);
//    pos.add(vel);
//    accel = new PVector();

//    if (screenWrap) {
//      if (pos.x>width)
//        pos.x = 0;
//      else if (pos.x<0)
//        pos.x = width;
//      if (pos.y>height)
//        pos.y = 0;
//      else if (pos.y<0)
//        pos.y = height;
//    } else {
//      if(pos.x<-worldMargin)
//        objs.remove(this);
//      else if(pos.x>worldMargin+width)
//        objs.remove(this);
//      else if(pos.y<-worldMargin)
//        objs.remove(this);
//      else if(pos.y>worldMargin+height)
//        objs.remove(this);
//    }
//  }

//  public void draw() {
//    pushMatrix();

//    translate(pos.x, pos.y);
//    noStroke();
//    fill(col);
//    circle(0, 0, size);

//    popMatrix();
//  }
//}
