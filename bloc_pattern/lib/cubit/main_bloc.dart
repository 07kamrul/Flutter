import 'package:bloc/bloc.dart';

// Event level

enum CounterEvent { increment, decrement }

//Bloc Level

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;

      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
    throw UnimplementedError();
  }
}

// Stream level

Future<void> main(List<String> args) async {
  final bloc = CounterBloc();

  final streamSubscription = bloc.listen(print);

  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);

  bloc.add(CounterEvent.decrement);
  bloc.add(CounterEvent.decrement);
  bloc.add(CounterEvent.decrement);

  await Future.delayed(Duration.zero);

  await streamSubscription.cancel();

  await bloc.close();
}
