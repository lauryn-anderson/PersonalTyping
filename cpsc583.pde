/**
 * Lauryn Anderson
 * CPSC 583
 * 
 * Dynamic plaid pattern generated from keyboard & mouse input
 */

ArrayList<Stripe> horizontals = new ArrayList<Stripe>();
ArrayList<Stripe> verticals = new ArrayList<Stripe>();

int horizontalCount;    // number of units in horizontal pattern
int verticalCount;      // number of units in vertical pattern
int horizontalWidth;    // width of each unit in horizontal pattern
int verticalWidth;      // width of each unit in vertical pattern

int lastMillis = 0;     // timestamp of last keypress
int milliFactor = 500;  // increment delay every 500 milliseconds

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

void redraw() {
  // draw plaid pattern based on horizontal and vertical stripes
  // opacity isn't an option, so have to iterate through every intersection
  // between horizontal and vertical stripes, summing color values manually
  
  background(50);
  int horizontalDelay = 0;  // track units drawn for horizontal stripes
  int verticalDelay = 0;    // track units drawn for vertical stripes
  
  if (horizontals.size() > 0) {
    for (int i = 0; i < horizontals.size(); i++) {
      Integer[] hFill = getColor(horizontals.get(i).keyType);
      
      if (verticals.size() > 0) {
        verticalDelay = 0;  // reset for next row
        for (int j = 0; j < verticals.size(); j++) {
          Integer[] vFill = getColor(verticals.get(j).keyType);
          
          // sum RGB colour values to get intersections
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
  // look at last key pressed and return type of key (letter, number, etc)
  
  if (key == BACKSPACE) return "delete";
  if (key >= 'a' && key <= 'z') return "lowercase";
  if (key >= 'A' && key <= 'Z') return "capital";
  if (key <= ' ') return "whitespace";
  if (key >= '0' && key <= '9') return "number";
  if (key < 'A') return "punctuation";
  return "other";
}

void keyPressed() {
  // every time a key is pressed, add another stripe to the pattern
  
  // record delay since last keypress
  int now = millis();
  int delay = (now - lastMillis) / milliFactor + 1;  // int division (automatic floor)
  lastMillis = now;  // update time for next comparison
  
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
  // change colour scheme every time mouse clicks
  
  swapScheme();
  redraw();
}

import java.util.Map;

HashMap<String, Integer[]> currentScheme;
HashMap<String, Integer[]> scheme1;
HashMap<String, Integer[]> scheme2;
HashMap<String, Integer[]> scheme3;
HashMap<String, Integer[]> scheme4;

void colorSetup() {
  // initialize various colour scheme options
  
  scheme1 = new HashMap<String, Integer[]>();
  scheme1.put("delete", new Integer[]{150, 150, 150});
  scheme1.put("lowercase", new Integer[]{50, 0, 0});
  scheme1.put("capital", new Integer[]{100, 0, 0});
  scheme1.put("whitespace", new Integer[]{0, 0, 70});
  scheme1.put("number", new Integer[]{10, 50, 0});
  scheme1.put("punctuation", new Integer[]{80, 20, 20});
  scheme1.put("other", new Integer[]{100, 100, 0});

  scheme2 = new HashMap<String, Integer[]>();
  scheme2.put("delete", new Integer[]{150, 150, 150});
  scheme2.put("lowercase", new Integer[]{80, 60, 0});
  scheme2.put("capital", new Integer[]{160, 120, 0});
  scheme2.put("whitespace", new Integer[]{50, 0, 100});
  scheme2.put("number", new Integer[]{0, 0, 0});
  scheme2.put("punctuation", new Integer[]{100, 0, 0});
  scheme2.put("other", new Integer[]{0, 50, 0});

  scheme3 = new HashMap<String, Integer[]>();
  scheme3.put("delete", new Integer[]{150, 150, 150});
  scheme3.put("lowercase", new Integer[]{20, 50, 10});
  scheme3.put("capital", new Integer[]{40, 100, 20});
  scheme3.put("whitespace", new Integer[]{0, 0, 0});
  scheme3.put("number", new Integer[]{100, 50, 0});
  scheme3.put("punctuation", new Integer[]{50, 50, 100});
  scheme3.put("other", new Integer[]{50, 50, 0});

  scheme4 = new HashMap<String, Integer[]>();
  scheme4.put("delete", new Integer[]{150, 150, 150});
  scheme4.put("lowercase", new Integer[]{40, 50, 80});
  scheme4.put("capital", new Integer[]{80, 100, 160});
  scheme4.put("whitespace", new Integer[]{30, 0, 30});
  scheme4.put("number", new Integer[]{50, 80, 20});
  scheme4.put("punctuation", new Integer[]{100, 80, 0});
  scheme4.put("other", new Integer[]{50, 50, 50});

  currentScheme = scheme1;
}

void swapScheme() {
  // iterate through colour scheme options
  
  if (currentScheme == scheme1) {
    currentScheme = scheme2;
  } else if (currentScheme == scheme2) {
    currentScheme = scheme3;
  } else if (currentScheme == scheme3) {
    currentScheme = scheme4;
  } else {
    currentScheme = scheme1;
  }
}

Integer[] getColor(String keyType) {
  // query selected colour scheme using type of key pressed
  
  return currentScheme.get(keyType);
}
