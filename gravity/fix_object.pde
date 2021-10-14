class FixedObject extends GravObject {
  public FixedObject(PVector pos, float mass, float size, PImage img) {
    super(pos, mass, size, new PVector(),img);
  }
  

  public void applyForce() {
    return;
  }

  public void update() {
    return;
  }
  
  public String toString(){
    return "Fixed "+pos.x+","+pos.y+","+pos.z+","+mass+","+size+","+hue(col);
  }
  
  public boolean isFixed(){
    return true;
  }
}
