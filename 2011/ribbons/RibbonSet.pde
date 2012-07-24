class RibbonSet {
  ArrayList ribbons;
  
  RibbonSet() {
    ribbons = new ArrayList();
    //println("RibbonSet Created");
  }
  
  void update() {
    for (int i=ribbons.size() - 1; i>=0; i--) {
      Ribbon r = (Ribbon) ribbons.get(i);
      r.grow();
    }
    for (int i=ribbons.size() - 1; i>=0; i--) {
      Ribbon r = (Ribbon) ribbons.get(i);
      r.update();
      if (r.growing && i>1) {
        for (int j=ribbons.size()-1; j>=0; j--) {
          if (i!=j) {
            Ribbon r2 = (Ribbon) ribbons.get(j);
            if (r.endCollide(r2)) {
              r.dodge();
            }
          }
        }
      }
      if (r.dead) {
        removeRibbonAtIndex(i);
      }
    }
  }
  
  void render() {
    for (int i=ribbons.size() - 1; i>=0; i--) {
      Ribbon r = (Ribbon) ribbons.get(i);
      r.render();
    }
  }
  Ribbon sometimesAddRibbon(float X, float Y){
    if (sometimes(20)) {
      return addRibbon(X, Y, randBool(), randBool(), randInt(4));
    }
    return null;
  }
  Ribbon addRibbon(float X, float Y, boolean Vertical, boolean Direction, int Col) {
    if (X>-40 && X<width+40 && Y>-40 && Y<height+40 && !pointOnRibbon(X,Y, null)) {
      Ribbon tempRibbon = new Ribbon(this, X, Y, Vertical, Direction, Col);
      ribbons.add(tempRibbon);
      return tempRibbon;
    }
    return null;
  }
  
  Ribbon addRibbon(float X, float Y, boolean Vertical, boolean Direction, int Col, Ribbon Parent) {
    if (!pointOnRibbon(X,Y, Parent)) {
      Ribbon tempRibbon = new Ribbon(this, X, Y, Vertical, Direction, Col);
      ribbons.add(tempRibbon);
      return tempRibbon;
    }
    return null;
  }
  
  void removeRibbonAtIndex(int I) {
    ribbons.remove(I);
  }
  
  void reset() {
    for (int i=ribbons.size() - 1; i>=0; i--) {
      ribbons.remove(0);
    }
    /*
    for (int i=0; i<25; i++) {
      addRibbon(width/2+round(random(-120,120)), height/2+round(random(-120,120)), randBool(), randBool(), randInt(4));
    }
    */
  }
  
  boolean pointOnRibbon(float X, float Y, Ribbon Parent) {
    for (int i=ribbons.size() - 1; i>=0; i--) {
      Ribbon r = (Ribbon) ribbons.get(i);
      if (r!=Parent) {
        if ( r.vertical &&  r.direction) {
          if (X<r.loc.x+ribbonWidth+ribbonSpacing && X>r.loc.x-ribbonWidth-ribbonSpacing &&
              Y>r.loc.y-ribbonWidth-ribbonSpacing && Y<r.end.y+ribbonWidth+ribbonSpacing)
          {
            return true;
          }
        } else
        if ( r.vertical && !r.direction) {
          if (X<r.loc.x+ribbonWidth+ribbonSpacing && X>r.loc.x-ribbonWidth-ribbonSpacing &&
              Y<r.loc.y+ribbonWidth+ribbonSpacing && Y>r.end.y-ribbonWidth-ribbonSpacing)
          {
            return true;
          }
        } else
        if (!r.vertical &&  r.direction) {
          if (Y<r.loc.y+ribbonWidth+ribbonSpacing && Y>r.loc.y-ribbonWidth-ribbonSpacing &&
              X>r.loc.x-ribbonWidth-ribbonSpacing && X<r.end.x+ribbonWidth+ribbonSpacing)
          {
            return true;
          }
        } else
        if (!r.vertical && !r.direction) {
          if (Y<r.loc.y+ribbonWidth+ribbonSpacing && Y>r.loc.y-ribbonWidth-ribbonSpacing &&
              X<r.loc.x+ribbonWidth+ribbonSpacing && X>r.end.x-ribbonWidth-ribbonSpacing)
          {
            return true;
          }
        }
      }
    }
    return false;
  }
  
  
}
