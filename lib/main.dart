import 'package:flutter/material.dart';

import './views/landingPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'app!',
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(fontSize: 15.0),
          body1: TextStyle(
            fontSize:15.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto"
          ),
        ),
        buttonTheme: ButtonThemeData(
          // buttonColor: Colors.blueAccent,
          // textTheme: ButtonTextTheme.accent,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            // side: BorderSide(color: Colors.red)
          ),

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
    return Scaffold(
        body: LandingPage(),
    );
  }  
}
