import 'package:flutter/material.dart';
// import './subscriptionPoint/calculator.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                      width: 150,
                      height: 100,
                      child:  RaisedButton(
                      onPressed: () {},
                      child: new Text("청약가점계산기"),
                    ),
                  ),
                  new SizedBox(
                      width: 150,
                      height: 100,
                      child:  RaisedButton(
                      onPressed: () {},
                      child: new Text("계산기"),
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                      width: 150,
                      height: 100,
                      child:  RaisedButton(
                      onPressed: () {},
                      child: new Text("계산기"),
                    ),
                  ),
                  new SizedBox(
                      width: 150,
                      height: 100,
                      child:  RaisedButton(
                      onPressed: () {},
                      child: new Text("계산기"),
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                      width: 150,
                      height: 100,
                      child:  RaisedButton(
                      onPressed: () {},
                      child: new Text("계산기"),
                    ),
                  ),
                  new SizedBox(
                      width: 150,
                      height: 100,
                      child:  RaisedButton(
                      onPressed: () {},
                      child: new Text("계산기"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}