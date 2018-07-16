import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app/Store/State.dart';
import 'package:flutter_app/Store/Actions.dart';


class Home extends StatelessWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title)
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new StoreConnector<CounterState, String>(
              converter: (store) => store.state.counter.toString(),
              builder: (context, counter) {
                return new Text(
                  counter,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        )
      ),
      floatingActionButton: new StoreConnector<CounterState, VoidCallback>(
          builder: (context, callback) {
            return new FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: new Icon(Icons.add),
            );
          },
          converter: (store) {
            return () => store.dispatch(ActionIncrement(amount: store.state.counter));
          })
    );
  }
}