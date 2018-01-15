float redLineX, redDotY; //variables for red slider
float greenLineX, greenDotY; //variables for green slider
float blueLineX, blueDotY; //variables for blue slider
float sizeLineX, sizeDotY; //variables for size slider
float buttonWidth, buttonHeight, buttonSpacing, buttonY; //variables for white, black and other buttons
float lineLength = 255, lineY, size, controlHeight;
float red, green, blue; //variables for the colour values

int sliderSize = 40; //size of the knob on sliders

PImage pizza;
float pizzaWidth, pizzaHeight;
boolean imageDisplay = false;

boolean pressed;

void setup() {
  background(255);
  rectMode(CENTER);
  
  redLineX = width * 0.125; 
  redDotY = height * 0.04;
  
  greenLineX = width * 0.1875; 
  greenDotY = height * 0.04 + 255;
  
  blueLineX = width * 0.25;
  blueDotY = height * 0.04 + 255;
  
  sizeLineX = width * 0.35;
  sizeDotY = height * 0.04 + 100;
  
  buttonY = height * 0.08;
  
  if (height > width) { //if device is in portrait mode
    buttonWidth = width * 0.125;
    buttonHeight = height * 0.04;
    buttonSpacing = height * 0.06;
  } else { //if device is in landscape mode
    buttonWidth = width * 0.08;
    buttonHeight = height * 0.06;
    buttonSpacing = height * 0.08;
  }
  
  lineY = height * 0.04;
  
  pizza = loadImage("pizzaColoring.jpg");
  
  controlHeight = 2 * lineY + lineLength;
}

void draw() {
  if (mousePressed) {
    if ((mouseX > redLineX - sliderSize / 2 && mouseX < redLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      //if mouse is over red slider
      if (redDotY >= lineY && redDotY <= lineY + lineLength) { //if slider is over line
        redDotY = mouseY;
      } else { //if slider isn't over line
        if (redDotY < lineY) { //if slider above line
          redDotY = lineY; //go to max value
        } else { //if slider under line
          redDotY = lineY + lineLength; //go to min value
        }
      }
    } else if ((mouseX > greenLineX - sliderSize / 2 && mouseX < greenLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      //if mouse is over green slider
      if (greenDotY >= lineY && greenDotY <= lineY + lineLength) { //if slider is over line
        greenDotY = mouseY; 
      } else { //if slider isn't over line
        if (greenDotY < lineY) { //if slider above line
          greenDotY = lineY; //go to max value
        } else { //if slider under line
          greenDotY = lineY + lineLength; //go to min value
        }
      }
    } else if ((mouseX > blueLineX - sliderSize / 2 && mouseX < blueLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      //if mouse is over blue slider
      if (blueDotY >= lineY && blueDotY <= lineY + lineLength) { //if slider is over line
        blueDotY = mouseY;
      } else { //if slider isn't over line
        if (blueDotY < lineY) { //if slider above line
          blueDotY = lineY; //go to max value
        } else { //if slider under line
          blueDotY = lineY + lineLength; //go to min value
        }
      }
    } else if ((mouseX > sizeLineX - sliderSize / 2 && mouseX < sizeLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      //if mouse is over size slider
      if (sizeDotY >= lineY && sizeDotY <= lineY + lineLength) { //if slider is over line
        sizeDotY = mouseY;
      } else { //if slider isn't over line
        if (sizeDotY < lineY) { //if slider above line
          sizeDotY = lineY; //go to max value
        } else { //if slider under line
          sizeDotY = lineY + lineLength; //go to min value
        }
      }
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (buttonY - buttonHeight / 2) && mouseY < (buttonY + buttonHeight / 2))) {
      redDotY = height * 0.04;
      greenDotY = height * 0.04;
      blueDotY = height * 0.04;
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (buttonY + buttonSpacing - buttonHeight / 2) && mouseY < (buttonY + buttonSpacing + buttonHeight / 2))) {
      redDotY = height * 0.04 + lineLength;
      greenDotY = height * 0.04 + lineLength;
      blueDotY = height * 0.04 + lineLength;
    } else if (((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (buttonY + 2 * buttonSpacing - buttonHeight / 2) && mouseY < (buttonY + 2 *buttonSpacing + buttonHeight / 2))) && !(pressed)) {
      if (width < height) {
        if (imageDisplay) {
          background(255);
          imageDisplay = false;
        } else {
          background(255);
          image(pizza, width / 10, height / 1.75 / 2, width / 1.45, height / 1.45);
          imageDisplay = true;
        }
      } else {
        background(255);
      }
      
      pressed = true;
    } else if (mouseY >= controlHeight) {
      strokeWeight(size);
      stroke(red, green, blue);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  } else {
    pressed = false;
  }
  
  drawControls();
  sliders();
}

void sliders() {
  strokeWeight(3);
  stroke(0);
  
  fill(255, 0, 0); //draw red slider
  line(redLineX, lineY, redLineX, lineY + lineLength);
  ellipse(redLineX, redDotY, sliderSize, sliderSize);
  
  fill(0, 255, 0); //draw green slider
  line(greenLineX, lineY, greenLineX, lineY + lineLength);
  ellipse(greenLineX, greenDotY, sliderSize, sliderSize);
  
  fill(0, 0, 255); //draw blue slider
  line(blueLineX, lineY, blueLineX, lineY + lineLength);
  ellipse(blueLineX, blueDotY, sliderSize, sliderSize);
  
  fill(255); //draw size slider
  line(sizeLineX, lineY, sizeLineX, lineY + lineLength);
  ellipse(sizeLineX, sizeDotY, sliderSize, sliderSize);
  
  red = lineLength - (redDotY - lineY); //sets the red value between 0 and 255 depending on knob position
  green = lineLength - (greenDotY - lineY); //sets the green value between 0 and 255 depending on knob position
  blue = lineLength - (blueDotY - lineY); //sets the blue value between 0 and 255 depending on knob position
  size = lineLength - (sizeDotY - lineY) + 10; //sets the size value between 10 and 265 depending on knob position
  
  noStroke();
}

void drawControls() {
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(width / 2, controlHeight / 2, width, controlHeight); //draws background for control panel
  
  fill(red, green, blue); //displays colour and size of pen
  ellipse(width * 0.78, controlHeight / 2, size, size);
  
  fill(0); //black button
  rect(width * 0.5, buttonY + buttonSpacing, buttonWidth, buttonHeight, 10);
  
  fill(127); //grey button
  rect(width * 0.5, buttonY + 2 * buttonSpacing, buttonWidth, buttonHeight, 10);
  
  fill(255); //white button
  rect(width * 0.5, buttonY, buttonWidth, buttonHeight, 10);
  
  if (height > width) { //if device is in portrait mode
    textSize(sliderSize);
    text("pizza", width * 0.5, height * 0.2 + buttonHeight / 8, buttonWidth, buttonHeight);
  } else { //if device is in landscape mode
    textSize(height * 0.05);
    text("clear", width * 0.5, buttonY * 2 + buttonSpacing + buttonHeight / 8, buttonWidth, buttonHeight);
  }
  
  noStroke();
}