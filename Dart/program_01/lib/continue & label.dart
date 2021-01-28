void main() {
  // Continue keyword
  // Label keyword

  myouterloop:
  for (int i = 1; i <= 3; i++) {
    myInnerLoop:
    for (int j = 1; j <= 3; j++) {
      if (i == 2 && j == 2) {
        continue myouterloop;
      }
      print("$i $j");
    }
  }
}
