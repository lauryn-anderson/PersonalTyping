/**
 * Lauryn Anderson
 * CPSC 583
 * 
 * Dynamic plaid pattern generated from keyboard & mouse input
 */
 
ArrayList<Stripe> horizontals = new ArrayList<Stripe>();
int horizontalWidth;
ArrayList<Stripe> verticals = new ArrayList<Stripe>();
int verticalWidth;
 
void setup() {
  size(700, 700); 
  noStroke();
  colorSetup();
  background(50);
}

void draw() {
}

void keyPressed() {
  if (mouseX >= mouseY) {
    verticals.add(new Stripe(0, 0));
    verticalWidth = width / verticals.size();
  } else {
    horizontals.add(new Stripe(0, 0));
    horizontalWidth = height / horizontals.size();
  }
  redraw();
}

void mouseClicked() {
  swapScheme();
  redraw();
}

void redraw() {
  background(50);
  if (horizontals.size() > 0) {
    for (int i = 0; i < horizontals.size(); i++) {
      Integer[] hFill = getColor(horizontals.get(i).keyType);
      
      if (verticals.size() > 0) {
        for (int j = 0; j < verticals.size(); j++) {
          Integer[] vFill = getColor(verticals.get(j).keyType);
          fill(hFill[0] + vFill[0], hFill[1] + vFill[1], hFill[2] + vFill[2]);
          rect((j * verticalWidth), (i * horizontalWidth), verticalWidth, horizontalWidth);
        }
      } else {
        // just do horizontals if no verticals
        fill(hFill[0], hFill[1], hFill[2]);
        rect(0, (i * horizontalWidth), width, horizontalWidth);
      }
    }
  } else {
    // just do verticals if no horizontals
    for (int j = 0; j < verticals.size(); j++) {
      Integer[] vFill = getColor(verticals.get(j).keyType);
      fill(vFill[0], vFill[1], vFill[2]);
      rect((j * verticalWidth), 0, verticalWidth, height);
    }
  }
}

class Stripe {
  int delay;
  int pressLength;
  String keyType;
  
  Stripe(int delay, int pressLength) {
    this.delay = delay;
    this.pressLength = pressLength;
    this.keyType = getKeyType();
  }
}

String getKeyType() {
  if (key == BACKSPACE) return "delete";
  if ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z')) return "letter";
  if (key <= ' ') return "whitespace";
  if (key >= '0' && key <= '9') return "number";
  if (key < 'A') return "punctuation";
  return "other";
}
