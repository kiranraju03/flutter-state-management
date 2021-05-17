import 'package:flutter/material.dart';
import 'package:flutter_bloc_state/bloc_pattern/counter_bloc.dart';
import 'package:flutter_bloc_state/bloc_pattern/counter_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'BLoc State Management from Scratch'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({
    this.title,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: StreamBuilder<Object>(
            stream: _counterBloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Text('Number: ${snapshot.data}');
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => _counterBloc.counterEventSink.add(
                DecrementEvent(),
              ),
              child: Icon(Icons.remove),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => _counterBloc.counterEventSink.add(
                IncrementEvent(),
              ),
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
