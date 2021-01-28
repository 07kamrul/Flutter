import 'dart:io';

void main() {
  var firstName = 'Kamrul'; // String type inference
  String lastName = 'Hasan'; // String type defined
  int number = 100; // integer type
  double cost = 11.40;
  dynamic isOkay = true; // dynamic type can holds any type

  print(firstName + ' ' + lastName);
  print(number);
  print(cost);
  print(isOkay);
}

void about() {
  stdout.writeln('What is your name: ?');
  // stdout.writeln('What is your name: ?');
  // stdout.writeln('What is your name: ?');

  String name = stdin.readLineSync();
  print('My name is: $name');
}
