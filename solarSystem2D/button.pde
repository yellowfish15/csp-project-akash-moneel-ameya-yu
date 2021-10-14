public class Button {
  int x, y, w, h;
  String text;
  public Button(int x, int y, int w, int h, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
  }
  
  void draw() {
    PFont font = createFont("Roboto-Bold.ttf", 50);
    textFont(font);
    stroke(255);
    fill(255);
    rect(x, y, w, h, 28);
    textAlign(CENTER, CENTER);
    fill(0);
    text(text, x + w/2, y + h/2);
  }
  
  boolean clickedOn() {
    return mouseX >= x && x + w >= mouseX && mouseY >= y && mouseY <= y + h;
  }
}
