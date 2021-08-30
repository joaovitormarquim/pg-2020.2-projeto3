int redButtonStatus = BLACK;
int greenButtonStatus = BLACK;
int blueButtonStatus = BLACK;

int COMPONENT_BUTTON_FONT_SIZE = 30;
int COLOR_BUTTON_FONT_SIZE = 25;

void buttons() {
    stroke(diffuseControl[0]);
    strokeWeight(4);
    fill(diffuseControl[1]);
    rect(2, 2, width/4-4, 40);
    fill(diffuseControl[2]);
    textSize(COMPONENT_BUTTON_FONT_SIZE);
    textAlign(CENTER, CENTER);
    text("Difuso", width/8, 20);

    stroke(specularControl[0]);
    strokeWeight(4);
    fill(specularControl[1]);
    rect(width/4+2, 2, width/4-4, 40);
    fill(specularControl[2]);
    textSize(COMPONENT_BUTTON_FONT_SIZE);
    textAlign(CENTER, CENTER);
    text("Especular", 3*width/8, 20);
    
    stroke(redButtonStatus);
    strokeWeight(4);
    fill(red, 0, 0);
    circle(7*width/12+20, 22, 40);
    fill(BLACK);
    textSize(COLOR_BUTTON_FONT_SIZE);
    textAlign(CENTER, CENTER);
    text("R", 7*width/12+20, 22);    

    stroke(greenButtonStatus);
    strokeWeight(4);
    fill(0, green, 0);
    circle(9*width/12, 22, 40);
    fill(BLACK);
    textSize(COLOR_BUTTON_FONT_SIZE);
    textAlign(CENTER, CENTER);
    text("G", 9*width/12, 22);

    stroke(blueButtonStatus);
    strokeWeight(4);
    fill(0, 0, blue);
    circle(11*width/12-20, 22, 40);
    fill(BLACK);
    textSize(COLOR_BUTTON_FONT_SIZE);
    textAlign(CENTER, CENTER);
    text("B", 11*width/12-20, 22);
}

void mouseClicked() {
    if (((mouseX > 2) && (mouseX <= width/4-2)) && ((mouseY >= 2) && (mouseY <= 40))) {
        if(diffuseControl[1] == GREY) {
            diffuseControl[0] = WHITE;
            diffuseControl[1] = BLACK;
            diffuseControl[2] = WHITE;
        } else {
            diffuseControl[0] = BLACK;
            diffuseControl[1] = GREY;
            diffuseControl[2] = BLACK;
        }
    } else if(((mouseX >= width/4-2) && (mouseX <= width/2-2)) && ((mouseY >= 2) && (mouseY <= 40))) {
        if(specularControl[1] == GREY) {
            specularControl[0] = WHITE;
            specularControl[1] = BLACK;
            specularControl[2] = WHITE;
        } else {
            specularControl[0] = BLACK;
            specularControl[1] = GREY;
            specularControl[2] = BLACK;
        }
    } else if((abs(mouseX - (7*width/12+20)) <= 22) && (abs(mouseY -22) <= 22)) {
        if(redButtonStatus == BLACK) {
            redButtonStatus = WHITE;
        } else {
            redButtonStatus = BLACK;
        }
    } else if((abs(mouseX - (9*width/12)) <= 22) && (abs(mouseY -22) <= 22)) {
        if(greenButtonStatus == BLACK) {
            greenButtonStatus = WHITE;
        } else {
            greenButtonStatus = BLACK;
        }
    } else if((abs(mouseX - (11*width/12-20)) <= 22) && (abs(mouseY -22) <= 22)) {
        if(blueButtonStatus == BLACK) {
            blueButtonStatus = WHITE;
        } else {
            blueButtonStatus = BLACK;
        }
    }
}

void keyPressed() {
    if(key == CODED) {
        if(redButtonStatus == WHITE) {
            if(keyCode == UP) {
                red = min(red + 5, 255);
            } else if (keyCode == DOWN) {
                red = max(red - 5, 0);
            }
        }
        if(greenButtonStatus == WHITE) {
            if(keyCode == UP) {
                green = min(green + 5, 255);
            } else if (keyCode == DOWN) {
                green = max(green - 5, 0);
            }
        }
        if(blueButtonStatus == WHITE) {
            if(keyCode == UP) {
                blue = min(blue + 5, 255);
            } else if (keyCode == DOWN) {
                blue = max(blue - 5, 0);
            }
        }
    }
}
