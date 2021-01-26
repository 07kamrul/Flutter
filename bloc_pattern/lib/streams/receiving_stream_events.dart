import 'dart:io';

Future<int> sumSTream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

main() async{
  print("Enter your number: ");

  int n = int.parse(stdin.readLineSync());

  var stream = countStream(n);

  var sum = await sumSTream(stream);

  print("Summation of the $n : $sum ");
}