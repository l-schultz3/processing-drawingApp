float redLineX = width * 0.125, redLineY = height * 0.04, redLineLength = 255, redDotY = height * 0.04;
float greenLineX = width * 0.1875, greenLineY = height * 0.04, greenLineLength = 255, greenDotY = height * 0.04 + 255;
float blueLineX = width * 0.25, blueLineY = height * 0.04, blueLineLength = 255, blueDotY = height * 0.04 + 255;

float red, green, blue;

int sliderSize = 40;
int size = 30;

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
}

void draw() {
  fill(255);
  rect(0, 0, width * 2, height / 1.75);
  
  fill(red, green, blue);
  rect(width * 0.75, 0, width / 2, height / 1.75);
  
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
    }
    
    fill(red, green, blue);
    if (lastDrawX > 0 && lastDrawY > 0) {
      checkTouch(mouseX, mouseY);
    } else {
      lastDrawX = mouseX;
      lastDrawY = mouseY;
    }
    ellipse(mouseX, mouseY, size, size);
    fill(0);
  } else {
    lastDrawX = -1;
    lastDrawY = -1;
  }
  
  colourSliders();
}

void checkTouch(int currentX, int currentY) {
  if ((currentX < lastDrawX - size / 2) || (currentX > lastDrawX + size / 2) || (currentY < lastDrawY - size / 2) || (currentY > lastDrawY + size / 2)) {
    /*float differenceInX = currentX - lastDrawX;
    float differenceInY = currentY - lastDrawY;*/
    
    //print("\ndifferenceInX = " + str(differenceInX) + " differenceInY = " + str(differenceInY));
    strokeWeight(size);
    stroke(red, green, blue);
    line(lastDrawX, lastDrawY, currentX, currentY);
  }
  
  lastDrawX = currentX;
  lastDrawY = currentY;
  
  noStroke();
}

void colourSliders() {
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
  
  red = redLineLength - (redDotY - redLineY);
  green = greenLineLength - (greenDotY - greenLineY);
  blue = blueLineLength - (blueDotY - blueLineY);
  
  noStroke();
}