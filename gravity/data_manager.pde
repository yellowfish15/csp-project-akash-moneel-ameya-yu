import java.util.*;/*
Names: Akash Joseph, Moneel Patel, Ameya Purao, Yu Lim
Date: 10/18/2021
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
  String[] lines = loadStrings("data/"+fileName);
  print(Arrays.toString(lines));
  ArrayList<GravObject> gList = new ArrayList();
  for(String l: lines){
    gList.add(fromString(l));
  }
  return gList;
  } catch(Exception e){
    print("sdiojfofnd");
    return new ArrayList();
  }
}

// "Grav "+pos.x+","+pos.y+","+pos.z+","+mass+","+size+","+vel.x+","+vel.y+","+vel.z+","+hue(col);

public GravObject fromString(String str){
  println("");
  String[] parts = str.split(" ");
  
  String[] sVals = parts[1].split(",");
  float[] vals = new float[sVals.length-1];
  for(int i=0; i<sVals.length-1; i++){
    println(sVals[i]);
    vals[i] = Float.valueOf(sVals[i]);
  }
  
  if(parts[0].equals("Fixed"))
    return fromFixedString(vals, sVals[5]);
  
  PVector pos = new PVector(vals[0],vals[1],vals[2]);
  float mass = vals[3];
  float size = vals[4];
  PVector vel = new PVector(vals[5],vals[6],vals[7]);
  PImage img = planets.get(sVals[8]);  
  return new GravObject(pos,mass,size,vel,img);
}
// "Fixed "+pos.x+","+pos.y+","+pos.z+","+mass+","+size+","+hue(col);
public FixedObject fromFixedString(float[] vals, String imgName){

  PVector pos = new PVector(vals[0],vals[1],vals[2]);
  float mass = vals[3];
  float size = vals[4];
  PImage img = planets.get(imgName);  
  return new FixedObject(pos,mass,size,img);
}
