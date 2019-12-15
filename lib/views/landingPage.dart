import 'package:flutter/material.dart';

import './home.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(
                child: Image.asset(
                'assets/img/ryan.jpeg',
                fit:BoxFit.fill,
                ),
                padding: const EdgeInsets.all(24.0),
              ),
    
              new Padding(
                child: Text(
                "잔잔바리 계산기",
                  style: new TextStyle(fontSize:22.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
                ),
                padding: const EdgeInsets.all(30.0),
              ),

              new RaisedButton(
                key:null, 
                // onPressed:buttonPressed(BuildContext context),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context){
                      return Home();
                    })
                  );
                },
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "화면전환용 임시버튼",
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                  )
              ),
            ]
          );
  }
}