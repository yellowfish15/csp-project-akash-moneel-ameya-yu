class GravObject{
  public PVector pos, vel, accel;
  public float mass,  size;
  public color col;
  
  public GravObject(float x, float y, float mass, PVector vel){
    pos = new PVector(x,y);
    accel = new PVector();
    this.mass = mass;
    this.size = mass*2;
    this.vel = vel;
    colorMode(HSB);
    col = color(random(255),255,255);
  }
  
  public void applyForce(PVector force){
    accel.add(force.div(mass));
  }
  
  public void update(){
    vel.add(accel);
    pos.add(vel);
    accel = new PVector();
  }
  
  public void draw(){
    noStroke();
    fill(col);
    circle(pos.x, pos.y, size);
  }
}
