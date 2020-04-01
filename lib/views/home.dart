import 'package:flutter/material.dart';
import './subscriptionPoint/calculator.dart';
import '../common/util.dart';
import 'package:firebase_admob/firebase_admob.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   SizedBox(
                      width: 150,
                      height: 150,
                      child:  RaisedButton(
                        color: ThemeColors("red").rgb,
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SpCalculator()),
                          );
                        },
                        child:  Text("청약가점\n계산기",textAlign: TextAlign.center,),
                    ),
                  ),
                   SizedBox(
                      width: 150,
                      height: 150,
                      child:  RaisedButton(
                        color: ThemeColors("orange").rgb,
                        onPressed: () {},
                        child:  Text("DTI"),
                    ),
                  ),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   SizedBox(
                      width: 150,
                      height: 150,
                      child:  RaisedButton(
                        color: ThemeColors("yellow").rgb,
                        onPressed: () {},
                        child:  Text("신DTI, DSR"),
                    ),
                  ),
                   SizedBox(
                      width: 150,
                      height: 150,
                      child:  RaisedButton(
                        color: ThemeColors("green").rgb,
                        onPressed: () {},
                        child:  Text("LTV"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}