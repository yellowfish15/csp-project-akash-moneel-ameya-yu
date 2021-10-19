/*
Names: Akash Joseph, Moneel Patel, Ameya Purao, Yu Lim
Date: 10/18/2021
*/
class FixedObject extends GravObject {
  //initializes the Sun, since in this simulation it doesn't move, we create a seperate class that initializes a gravobject with a null velocity
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
