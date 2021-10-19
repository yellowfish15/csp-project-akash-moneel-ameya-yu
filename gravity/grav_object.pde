/*
Names: Akash Joseph, Moneel Patel, Ameya Purao, Yu Lim
Date: 10/18/2021
*/
class GravObject{
  public PVector pos, vel, accel;// initializing instance variables containing the properties of each object
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
    shape = createShape(SPHERE, size); //estimating planet shape as spheres
    shape.setTexture(img); //texture is wrapped around the sphere
  }
  
  public void applyForce(PVector force){
    accel.add(force); //adding a force of attraction
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
