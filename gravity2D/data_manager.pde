/*
 * Created by: Akash Joseph, Moneel Patel, Ameya Purao, Yu Lim
 * Mrs. Castillo, Period 1 Computer Science Principles Project
 *
 */

public void writeToFile(String fileName){
  PrintWriter output = createWriter("data/saves/"+fileName);
  for(GravObject gObj : objs){
    output.println(gObj.toString());
  }
  output.flush();
  output.close();
}

public ArrayList<GravObject> readFromFile(String fileName){
  try{
  String[] lines = loadStrings("data/saves/"+fileName);
  ArrayList<GravObject> gList = new ArrayList();
  for(String l: lines){
    gList.add(fromString(l));
  }
  return gList;
  } catch(Exception e){
    return new ArrayList();
  }
}

// "Grav "+pos.x+","+pos.y+","+pos.z+","+mass+","+size+","+vel.x+","+vel.y+","+vel.z+","+hue(col);

public GravObject fromString(String str){
  String[] parts = str.split(" ");
  
  String[] sVals = parts[1].split(",");
  float[] vals = new float[sVals.length];
  for(int i=0; i<sVals.length; i++){
    vals[i] = Float.valueOf(sVals[i]);
  }
  
  if(parts[0].equals("Fixed"))
    return fromFixedString(vals);
  
  PVector pos = new PVector(vals[0],vals[1],vals[2]);
  float mass = vals[3];
  float size = vals[4];
  PVector vel = new PVector(vals[5],vals[6],vals[7]);
  color col = color(vals[8],255,255);
  
  return new GravObject(pos,mass,size,vel,col);
}
// "Fixed "+pos.x+","+pos.y+","+pos.z+","+mass+","+size+","+hue(col);
public FixedObject fromFixedString(float[] vals){
  PVector pos = new PVector(vals[0],vals[1],vals[2]);
  float mass = vals[3];
  float size = vals[4];
  color col = color(vals[5],255,255);
  
  return new FixedObject(pos,mass,size,col);
}
