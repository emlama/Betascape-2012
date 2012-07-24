color colors[] = {color(233, 76, 0, 196),color(252, 143, 0, 153),color(179, 215, 0, 188), color(0, 157, 233, 176)};
float ribbonWidth = 6;
float ribbonSpacing = 4;

RibbonSet ribbons;

void setup() {
  size(1100,600);
  smooth();
  frameRate(60);
  noStroke();
  
  ribbons = new RibbonSet();
  ribbons.reset();

  //can expose the ribbons object to js by defining
  //this function in js and calling it here
  //probably need to comment this out to compile with
  //regular processing/java
  exposeRibbons(ribbons);

  //PFont font = createFont("Verdana", 10);
  //textFont(font);
  ellipseMode(CENTER);


  for(int i=0;i<5;i++){
    ribbons.addRibbon(600+randInt(200), 30+randInt(100), randBool(), randBool(), randInt(4));
    ribbons.addRibbon(50+randInt(100), 200+randInt(100), randBool(), randBool(), randInt(4));
  }
}

void draw() {
  background(255,255,255);
  
  ribbons.update();
  ribbons.render();
}
