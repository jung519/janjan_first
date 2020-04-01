import 'package:flutter/material.dart';

import './home.dart';

class LandingPage extends StatelessWidget {
  nextPage(context){
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: (){
        nextPage(context);
      },
      child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Padding(
                child: Image.asset(
                'assets/img/logo.png',
                fit:BoxFit.fill,
                height: 130,
                ),
                padding: const EdgeInsets.all(24.0),
              ),
          ]
        ),
      )
    )
    );
    
  }
}

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const StatefulWrapper({@required this.onInit, @required this.child});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}
class _StatefulWrapperState extends State<StatefulWrapper> {
@override
  void initState() {
    if(widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}