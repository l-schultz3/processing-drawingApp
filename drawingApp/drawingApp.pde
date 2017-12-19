float redLineX, redLineY, redLineLength, redDotY;
float greenLineX, greenLineY, greenLineLength, greenDotY;
float blueLineX, blueLineY, blueLineLength, blueDotY;
float sizeLineX, sizeLineY, sizeLineLength, sizeDotY;
float buttonWidth, buttonHeight;

float red, green, blue;

int sliderSize = 40;
float size;

float lastDrawX = -1, lastDrawY = -1;

void setup() {
  background(255);
  noFill();
  rectMode(CENTER);
  
  frameRate(120);
  
  redLineX = width * 0.125; 
  redLineY = height * 0.04; 
  redLineLength = 255; 
  redDotY = height * 0.04;
  
  greenLineX = width * 0.1875; 
  greenLineY = height * 0.04; 
  greenLineLength = 255;
  greenDotY = height * 0.04 + 255;
  
  blueLineX = width * 0.25;
  blueLineY = height * 0.04; 
  blueLineLength = 255; 
  blueDotY = height * 0.04 + 255;
  
  sizeLineX = width * 0.35;
  sizeLineY = height * 0.04; 
  sizeLineLength = 255;
  sizeDotY = height * 0.04 + 100;
  
  buttonWidth = width * 0.125;
  buttonHeight = height * 0.04;
}

void draw() {
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(0, 0, width * 2, height / 1.75 - 1);
  
  fill(red, green, blue);
  ellipse(width * 0.75, (height / 1.75) / 4, size, size);
  
  fill(255);
  rect(width * 0.50, height * 0.08, buttonWidth, buttonHeight, 10);
  
  fill(0);
  rect(width * 0.50, height * 0.21, buttonWidth, buttonHeight, 10);
  
  noStroke();
  
  if (mousePressed) {
    if ((mouseX > redLineX - sliderSize / 2 && mouseX < redLineX + sliderSize / 2) && (mouseY > redLineY && mouseY < redLineY + redLineLength)) {
      if (redDotY >= redLineY && redDotY <= redLineY + redLineLength) {
        redDotY = mouseY;
      } else {
        if (redDotY < redLineY) {
          redDotY = redLineY;
        } else {
          redDotY = redLineY + redLineLength;
        }
      }
    } else if ((mouseX > greenLineX - sliderSize / 2 && mouseX < greenLineX + sliderSize / 2) && (mouseY > greenLineY && mouseY < greenLineY + greenLineLength)) {
      if (greenDotY >= greenLineY && greenDotY <= greenLineY + greenLineLength) {
        greenDotY = mouseY;
      } else {
        if (greenDotY < greenLineY) {
          greenDotY = greenLineY;
        } else {
          greenDotY = greenLineY + greenLineLength;
        }
      }
    } else if ((mouseX > blueLineX - sliderSize / 2 && mouseX < blueLineX + sliderSize / 2) && (mouseY > blueLineY && mouseY < blueLineY + blueLineLength)) {
      if (blueDotY >= blueLineY && blueDotY <= blueLineY + blueLineLength) {
        blueDotY = mouseY;
      } else {
        if (blueDotY < blueLineY) {
          blueDotY = blueLineY;
        } else {
          blueDotY = blueLineY + blueLineLength;
        }
      }
    } else if ((mouseX > sizeLineX - sliderSize / 2 && mouseX < sizeLineX + sliderSize / 2) && (mouseY > sizeLineY && mouseY < sizeLineY + sizeLineLength)) {
      if (sizeDotY >= sizeLineY && sizeDotY <= sizeLineY + sizeLineLength) {
        sizeDotY = mouseY;
      } else {
        if (sizeDotY < sizeLineY) {
          sizeDotY = sizeLineY;
        } else {
          sizeDotY = sizeLineY + sizeLineLength;
        }
      }
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.08 - buttonHeight / 2) && mouseY < (height * 0.08 + buttonHeight / 2))) {
      redDotY = height * 0.04;
      greenDotY = height * 0.04;
      blueDotY = height * 0.04;
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.21 - buttonHeight / 2) && mouseY < (height * 0.21 + buttonHeight / 2))) {
      redDotY = height * 0.04 + redLineLength;
      greenDotY = height * 0.04 + greenLineLength;
      blueDotY = height * 0.04 + blueLineLength;
    }
    
    if (mouseY >= height / 1.75 / 2) {
      fill(red, green, blue);
      if (lastDrawX > 0 && lastDrawY > 0) {
        checkTouch(mouseX, mouseY);
      } else {
        lastDrawX = mouseX;
        lastDrawY = mouseY;
      }
      ellipse(mouseX, mouseY, size, size);
      fill(0);
    }
  } else {
    lastDrawX = -1;
    lastDrawY = -1;
  }
  
  sliders();
}

void checkTouch(int currentX, int currentY) {
  if ((currentX < lastDrawX - size / 2) || (currentX > lastDrawX + size / 2) || (currentY < lastDrawY - size / 2) || (currentY > lastDrawY + size / 2)) {
    strokeWeight(size);
    stroke(red, green, blue);
    line(lastDrawX, lastDrawY, currentX, currentY);
  }
  
  lastDrawX = currentX;
  lastDrawY = currentY;
  
  noStroke();
}

void sliders() {
  strokeWeight(3);
  stroke(0);
  fill(255, 0, 0);
  line(redLineX, redLineY, redLineX, redLineY + redLineLength);
  ellipse(redLineX, redDotY, sliderSize, sliderSize);
  
  fill(0, 255, 0);
  line(greenLineX, greenLineY, greenLineX, greenLineY + greenLineLength);
  ellipse(greenLineX, greenDotY, sliderSize, sliderSize);
  
  fill(0, 0, 255);
  line(blueLineX, blueLineY, blueLineX, blueLineY + blueLineLength);
  ellipse(blueLineX, blueDotY, sliderSize, sliderSize);
  
  fill(255);
  line(sizeLineX, sizeLineY, sizeLineX, sizeLineY + sizeLineLength);
  ellipse(sizeLineX, sizeDotY, sliderSize, sliderSize);
  
  red = redLineLength - (redDotY - redLineY);
  green = greenLineLength - (greenDotY - greenLineY);
  blue = blueLineLength - (blueDotY - blueLineY);
  size = sizeLineLength - (sizeDotY - sizeLineY) + 15;
  
  noStroke();
}