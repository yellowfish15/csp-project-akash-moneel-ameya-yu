class FixedObject extends GravObject {
  public FixedObject(PVector pos, float mass, float size) {
    super(pos, mass, size, new PVector());
  }
  
  public FixedObject(PVector pos, float mass, float size, color col) {
    super(pos, mass, size, new PVector(), col);
  }

  public void applyForce() {
    return;
  }

  public void update() {
    return;
  }
  
  public FixedObject clone(){
    return new FixedObject(pos.copy(),mass,size);
  }
  
  public String toString(){
    return "Fixed "+pos.x+","+pos.y+","+pos.z+","+mass+","+size+","+hue(col);
  }
  
  public boolean isFixed(){
    return true;
  }
}
