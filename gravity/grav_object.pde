class GravObject{
  public PVector pos, vel, accel;
  public float mass,  size;
  public color col;
  public PShape shape;
  
  public GravObject(PVector pos, float mass, float size, PVector vel1, PImage img){
    int scaleFactor = 1;
    this.pos = pos.mult(scaleFactor);
    accel = new PVector();
    this.mass = mass;
    this.size = size;
    //PVector vel2 = new PVector(vel1.x*scalefactor, vel1.y*scalefactor, vel1.z*scalefactor);
    this.vel = vel1;
    noFill();
    noStroke();
    shape = createShape(SPHERE, size);
    shape.setTexture(img);
  }
  
  public void applyForce(PVector force){
    accel.add(force);
  }
  
  public void update(){
    vel.add(accel);
    pos.add(vel);
    accel = new PVector();
  }
  
  public void draw(){
    pushMatrix();
    
    translate(pos.x, pos.y, pos.z);
    stroke(255);
    fill(col);
    shape(shape);
    
    popMatrix();
  }
}
