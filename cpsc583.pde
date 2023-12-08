/**
 * Lauryn Anderson
 * CPSC 583
 * 
 * Dynamic plaid pattern generated from keyboard & mouse input
 */

ArrayList<Stripe> horizontals = new ArrayList<Stripe>();
int horizontalCount;
int horizontalWidth;
ArrayList<Stripe> verticals = new ArrayList<Stripe>();
int verticalCount;
int verticalWidth;

int lastMillis = 0;
int milliFactor = 500;

void setup() {
  size(700, 700); 
  noStroke();
  colorSetup();
  background(50);
}

void draw() {
  // leave this here so it is willing to redraw, 
  // but actual drawing steps happen in redraw()
}

void keyPressed() {
  // decide width based on delay from last keypress
  int now = millis();
  int delay = (now - lastMillis) / milliFactor + 1; // int division so automatic floor
  lastMillis = now;
  
  // decide horizontal/vertical based on mouse position
  if (mouseX >= mouseY) {
    verticals.add(new Stripe(delay));
    verticalCount += delay;
    verticalWidth = width / verticalCount;
  } else {
    horizontals.add(new Stripe(delay));
    horizontalCount += delay;
    horizontalWidth = height / horizontalCount;
  }
  redraw();
}

void mouseClicked() {
  swapScheme();
  redraw();
}

void redraw() {
  // opacity isn't an option, so have to iterate through every intersection
  // between horizontal and vertical stripes, summing color values manually
  
  background(50);
  int horizontalDelay = 0;
  int verticalDelay = 0;
  if (horizontals.size() > 0) {
    for (int i = 0; i < horizontals.size(); i++) {
      Integer[] hFill = getColor(horizontals.get(i).keyType);
      
      if (verticals.size() > 0) {
        verticalDelay = 0;
        for (int j = 0; j < verticals.size(); j++) {
          Integer[] vFill = getColor(verticals.get(j).keyType);
          fill(hFill[0] + vFill[0], hFill[1] + vFill[1], hFill[2] + vFill[2]);
          
          rect(
            (verticalWidth * verticalDelay), 
            (horizontalWidth * horizontalDelay), 
            (verticalWidth * verticals.get(j).delay), 
            (horizontalWidth * horizontals.get(i).delay)
          );
          
          verticalDelay += verticals.get(j).delay;
        }
      } else {
        // just do horizontals if no verticals
        fill(hFill[0], hFill[1], hFill[2]);
        
        rect(
          0, 
          (horizontalWidth * horizontalDelay), 
          width, 
          (horizontalWidth * horizontals.get(i).delay)
        );
        
      }
      horizontalDelay += horizontals.get(i).delay;
    }
  } else {
    // just do verticals if no horizontals
    for (int j = 0; j < verticals.size(); j++) {
      Integer[] vFill = getColor(verticals.get(j).keyType);
      fill(vFill[0], vFill[1], vFill[2]);
      
      rect(
        (verticalWidth * verticalDelay), 
        0, 
        (verticalWidth * verticals.get(j).delay), 
        height
      );
      
      verticalDelay += verticals.get(j).delay;
    }
  }
}

class Stripe {
  int delay;
  String keyType;
  
  Stripe(int delay) {
    this.delay = delay;
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
