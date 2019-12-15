import 'package:flutter/material.dart';

import './views/landingPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'app!',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
           shape: RoundedRectangleBorder(),
           textTheme: ButtonTextTheme.accent,
        )
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  _Main createState() => _Main();
}

class _Main extends State<Main> {
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: LandingPage(),
      )
    );
  }  
}
