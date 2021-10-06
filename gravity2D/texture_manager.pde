float sX = floor(random(100)), sY=floor(random(100));
float mult = 1;

public PImage getRandomTexture(float w, float h, float r, float g, float b){
  PImage img = createImage(400,400,RGB);
  img.loadPixels();
  for(int x=0; x<img.width; x++){
    for(int y=0; y<img.width; y++){
      int loc = x+y*img.width;
      float nX = sX+mult*x;
      float nY = sY+mult*y;
      float ns = noise(nX, nY);
      img.pixels[loc] = color(ns*r, ns*g, ns*b);
    }
  }
  img.updatePixels();
  return img;
}
