float redLineX = 100, redLineY = 50, redLineLength = 255, redDotY = 50;
float greenLineX = 150, greenLineY = 50, greenLineLength = 255, greenDotY = 250;
float blueLineX = 200, blueLineY = 50, blueLineLength = 255, blueDotY = 250;

float red, green, blue;

int sliderSize = 40;

void setup() {
  background(255);
  noFill();
  rectMode(CENTER);
}

void draw() {
  fill(255);
  rect(0, 0, width * 2, height / 1.75);
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
    ellipse(mouseX, mouseY, 30, 30);
    fill(0);
  }
  
  colourSliders();
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