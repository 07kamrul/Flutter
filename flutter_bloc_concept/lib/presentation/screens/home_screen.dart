import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concept/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concept/presentation/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenKey,
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
                  homeScreenKey.currentState.showSnackBar(SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  ),);
                } else if (state.wasIncremented == false) {
                  homeScreenKey.currentState.showSnackBar(SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  ),);
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
                  heroTag: Text('${widget.title}'),

                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} 2nd'),
                  onPressed: () {
                    // context.bloc<CounterCubit>().increament();
                    BlocProvider.of<CounterCubit>(context).increament();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/second',
                  arguments: homeScreenKey,
                );
              },
              child: Text('Go to Second Screen'),
            )
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
