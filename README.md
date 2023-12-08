# Assignment 3: Personalizing typed text through artistic visualizations
### Lauryn Anderson
### CPSC 583, Fall 2023

In this assignment, I designed a visualization of keyboard and mouse input to create an attractive representation of personal typing characteristics. To come up with an effective design, I was inspired by a type of artistic design that has been used for centuries to encode identity. 

Tartan/plaid is a patterned cloth that criss-crosses horizontal and vertical stripes to form rectangular patterns. From at least the 1800s, certain patterns have been used as distinctive symbols for Scottish clans or families. 

My tool, implemented in Processing, creates a unique plaid pattern dynamically based on the following inputs:

Keyboard input: 

1. Character added/key pressed is encoded with colour. Each character is represented with a different stripe, and the colour is derived from the type of character, whether letter, number, punctuation, whitespace, or other characters. 
2. Within the set of letters, capital and lowercase letters are distinguished by value, where capital letters are more opaque and lowercase letters are more translucent.
3. Since deleting letters does not add characters like the other keys, deletion is always given a stripe of white that stands out from the rest of the colour scheme. 
4. A stripe's width encodes the delay before a keypress, so if the typer waits a few seconds before adding an exclamation mark, then the corresponding stripe will be extra wide. 
5. As a result of these design choices, the overall length of the text/time to write it is encoded in the complexity of the pattern, as longer texts will have more stripes in total. 

Mouse input: 

1. Mouse position determines the orientation of the lines being added. If the mouse is in the top-right half of the window, then vertical stripes are added. If the mouse is in the bottom-left half of the window, then horizontal stripes are added. 
2. Mouse clicks determine the colour scheme of the plaid. As the mouse is clicked, the design cycles through a few pre-defined colour schemes, so that the typer can select the one they prefer. 

Overall, I am satisfied with the attractive, personal, and engaging representation that emerges as I type using this interactive visualization. 
