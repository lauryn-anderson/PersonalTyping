/**
 * Lauryn Anderson
 * CPSC 583
 * 
 * Color scheme options for the dynamic plaid pattern
 */

import java.util.Map;

HashMap<String, Integer[]> currentScheme;
HashMap<String, Integer[]> scheme1;
HashMap<String, Integer[]> scheme2;
HashMap<String, Integer[]> scheme3;

void colorSetup() {
  scheme1 = new HashMap<String, Integer[]>();
  scheme1.put("delete", new Integer[]{150, 150, 150});
  scheme1.put("letter", new Integer[]{50, 0, 0});
  scheme1.put("whitespace", new Integer[]{0, 0, 50});
  scheme1.put("number", new Integer[]{0, 50, 0});
  scheme1.put("punctuation", new Integer[]{50, 50, 0});
  scheme1.put("other", new Integer[]{100, 100, 0});

  scheme2 = new HashMap<String, Integer[]>();
  scheme2.put("delete", new Integer[]{150, 150, 150});
  scheme2.put("letter", new Integer[]{100, 80, 0});
  scheme2.put("whitespace", new Integer[]{50, 0, 100});
  scheme2.put("number", new Integer[]{0, 0, 0});
  scheme2.put("punctuation", new Integer[]{100, 0, 0});
  scheme2.put("other", new Integer[]{0, 50, 0});

  scheme3 = new HashMap<String, Integer[]>();
  scheme3.put("delete", new Integer[]{150, 150, 150});
  scheme3.put("letter", new Integer[]{20, 50, 20});
  scheme3.put("whitespace", new Integer[]{0, 0, 0});
  scheme3.put("number", new Integer[]{100, 50, 0});
  scheme3.put("punctuation", new Integer[]{50, 50, 100});
  scheme3.put("other", new Integer[]{50, 50, 0});

  currentScheme = scheme1;
}

void swapScheme() {
  if (currentScheme == scheme1) {
    currentScheme = scheme2;
  } else if (currentScheme == scheme2) {
    currentScheme = scheme3;
  } else {
    currentScheme = scheme1;
  }
}

Integer[] getColor(String keyType) {
  return currentScheme.get(keyType);
}
