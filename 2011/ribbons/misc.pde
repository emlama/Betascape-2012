boolean randBool() {
  return boolean(floor(random(2)));
}

int randInt(int N) {
  return floor(random(N));
}

boolean sometimes(float percent) {
  if (random(100)<percent) {
    return true;
  }
  return false;
}
