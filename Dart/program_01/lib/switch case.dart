import 'dart:io';

void main(){

  print("Enter your grade: ");
  String grad = stdin.readLineSync();

  switch (grad){
    case "A":
      print("Excellent grade of A");
      break;

    case "B":
      print("Very Good");
      break;

    case "C":
      print("Good enough. But work hard");
      break;

    default:
      print("You have failed !");
  }
}