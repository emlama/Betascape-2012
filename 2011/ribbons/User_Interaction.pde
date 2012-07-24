void mousePressed() {
  //ribbons.reset();
}

void keyPressed() {
}

void mouseMoved() {
    ribbons.sometimesAddRibbon(mouseX, mouseY, randBool(), randBool(), randInt(4));
}
