import 'package:flutter/material.dart';

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
      home: HomePage(title: 'Local State Management'),
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
  int count;

  @override
  void initState() {
    count = 0;
    super.initState();
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Number: $count'),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: decrement,
              child: Icon(Icons.remove),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: increment,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
