import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);
  print(counterState1 == counterState2);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          title: 'Flutter Bloc Pattern',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(),
            child: MyHomePage(title: 'Bloc Pattern Home Page'),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.wasIncremented == false) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'Negative No: ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue != 0 &&
                    state.counterValue % 2 == 0) {
                  return Text(
                    'Positive Even ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 7) {
                  return Text(
                    'Birthday ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    'Positive Odd: ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // context.bloc<CounterCubit>().increament();
                    BlocProvider.of<CounterCubit>(context).increament();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
