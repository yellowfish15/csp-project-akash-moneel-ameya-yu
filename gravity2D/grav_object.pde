/*
 * Created by: Akash Joseph, Moneel Patel, Ameya Purao, Yu Lim
 * Mrs. Castillo, Period 1 Computer Science Principles Project
 *
 */

class GravObject {
  public PVector pos, vel, accel;
  public float mass, size;
  public color col;
  public PShape shape;

  public GravObject(PVector pos, float mass, float size, PVector vel) {
    this(pos,mass,size,vel,color(random(255), 255, 255));
  }

  public GravObject(PVector pos, float mass, float size, PVector vel, color col){
    this.pos = pos;
    accel = new PVector();
    this.mass = mass;
    this.size = size;
    this.vel = vel;
    this.col = col;
  }

  public void applyForce(PVector force) {
    accel.add(force);
  }

  public void update() {
    vel.add(accel);
    pos.add(vel);
    accel = new PVector();

    if (screenWrap) {
      if (pos.x>width)
        pos.x = 0;
      else if (pos.x<0)
        pos.x = width;
      if (pos.y>height)
        pos.y = 0;
      else if (pos.y<0)
        pos.y = height;
    } else {
      if(pos.x<-worldMargin)
        objs.remove(this);
      else if(pos.x>worldMargin+width)
        objs.remove(this);
      else if(pos.y<-worldMargin)
        objs.remove(this);
      else if(pos.y>worldMargin+height)
        objs.remove(this);
    }
  }

  public void draw() {
    pushMatrix();

    translate(pos.x, pos.y);
    noStroke();
    fill(col);
    circle(0, 0, size);

    popMatrix();
  }
  
  public GravObject clone(){
    return new GravObject(pos.copy(),mass,size,vel.copy(),col);
  }
  
  public String toString(){
    return "Grav "+pos.x+","+pos.y+","+pos.z+","+mass+","+size+","+vel.x+","+vel.y+","+vel.z+","+hue(col);
  }
  
  public boolean isFixed(){
    return false;
  }
}
