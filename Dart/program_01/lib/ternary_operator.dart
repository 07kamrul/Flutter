void main() {
  int a = 2;
  int b = 3;
  int smallNumber;

  //if else statement
  if (a < b) {
    smallNumber = a;
  } else {
    smallNumber = b;
  }

  print("$smallNumber is smallers");

  //1. condition ? exp1 : exp2
  // If condition is true, evalutes exp1 (and returns it value);
  //otherwise, evaluates and return the value of exp2.

  //Ternary Operation
  a < b ? print("$a is smaller") : print("$b is smaller");

  //or
  smallNumber = a < b ? a : b;

  print("$smallNumber is smaller");

  /*2. exp1 ?? exp2
 if exp2 is non-null, return its value; otherwise, evalutes and
 returns the value of exp2.
  */

  String name = null;
  String nameToPoint = name ?? "Guest User";
  print(nameToPoint);
}
