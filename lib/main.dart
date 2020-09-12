import 'package:flutter/material.dart';

void main() {
  runApp(DhikrApp());
}

class DhikrApp extends StatelessWidget {
  static const String APP_TITLE = "Dhikr App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: APP_TITLE),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _elapsed = 0;
  int _elapsedLoops = 0;
  int _maxCounter = 100;

  void _pushSettings() {
    final settingsRoute = MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Settings Page"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello there',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        );
      },
    );
    Navigator.of(context).push(settingsRoute);
  }

  void _incrementCounter() {
    setState(() {
      _elapsed++;
      if (_elapsed == _maxCounter) {
        _elapsed = 0;
        _elapsedLoops++;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _elapsed = 0;
    });
  }

  void _resetLoopCounter() {
    setState(() {
      _elapsedLoops = 0;
    });
  }

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
                '$_elapsed / $_elapsedLoops',
                style: Theme.of(context).textTheme.headline4,
              ),
              IconButton(
                icon: Icon(Icons.fingerprint),
                onPressed: _incrementCounter,
                iconSize: 128,
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 80.0,
          width: 160.0,
          child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.all(10), children: <Widget>[
            Container(
              width: 80,
              child: FittedBox(
                  child: FloatingActionButton(
                      child: Icon(Icons.settings), backgroundColor: Colors.black87, onPressed: _pushSettings)),
            ),
            Container(
                width: 80,
                child: FittedBox(
                  child: InkWell(
                      splashColor: Colors.blue,
                      onLongPress: _resetLoopCounter,
                      child: FloatingActionButton(child: Icon(Icons.replay), onPressed: _resetCounter)),
                ))
          ]),
        ));
  }
}
