/**
 * Lauryn Anderson
 * CPSC 583
 * 
 * Color scheme options for the dynamic plaid pattern
 */

import java.util.Map;

HashMap<String, Integer[]> currentScheme;
HashMap<String, Integer[]> scheme1;

void colorSetup() {
  scheme1 = new HashMap<String, Integer[]>();
  scheme1.put("letter", new Integer[]{55, 0, 0});
  scheme1.put("other", new Integer[]{0, 55, 0});
  
  currentScheme = scheme1;
}

Integer[] getColor(String keyType) {
  return currentScheme.get(keyType);
}
