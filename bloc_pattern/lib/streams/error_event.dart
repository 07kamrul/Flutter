import 'dart:io';

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (var value in stream) {
      sum += value;
    }
  } catch (e) {
    return -1;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 9) {
      throw new Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}

main() async {
  print("Enter the number: ");
  int n = int.parse(stdin.readLineSync());
  var stream = countStream(n);
  var sum = await sumStream(stream);
  print("Summation of the $n : $sum");
}
