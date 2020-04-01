import 'package:estate_calculator/common/dropDown.dart';
import 'package:estate_calculator/common/util.dart';
import 'package:estate_calculator/service/calculate.dart';
import 'package:estate_calculator/common/popupText.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'dart:io' show Platform;
import './homelessPeriod.dart';
import './result.dart';


class SpCalculator extends StatefulWidget {
  @override
  _SpCalculatorState createState() => _SpCalculatorState();
}

class _SpCalculatorState extends State<SpCalculator> {
  int homeLessPeriod;
  int partner;
  int people_1;
  int people_2;
  int people_3;
  Color isValidate_1 = Colors.transparent;
  Color isValidate_2 = Colors.transparent;
  Color isValidate_3 = Colors.transparent;
  Color isValidate_4 = Colors.transparent;
  Color isValidate_5 = Colors.transparent;
  Color isValidate_6 = Colors.transparent;
  String subscriptionAccount = '날자선택';
  String pickedDate = '';
  int _numOfDependents = 0;
  var numOfDependents;
  int accountCreatedDate = 0;
  var _dateScore;
  int accountScore = 0;
  var _totalScore;

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutter', 'firebase', 'admob'],
    testDevices: <String>[],
  );

  BannerAd bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      });

  @override
  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(
        appId: Platform.isIOS
            // iOS Test App ID
            ? 'ca-app-pub-3940256099942544~1458002511'
            // Android Test App ID
            : 'ca-app-pub-3940256099942544~3347511713');
    bannerAd..load()..show();
  }

    @override
    Widget build(BuildContext context) {
      _validationCheck(arr){
        var isValied = true;
        for (var it in arr) {
          if(it == null){
            isValied = false;
          }
        }
        if (!isValied) {
          setState(() {
          this.isValidate_1 =  arr[0] == null ? Colors.red : Colors.transparent;
          this.isValidate_2 =  arr[1] == null ? Colors.red : Colors.transparent;
          this.isValidate_3 =  arr[2] == null ? Colors.red : Colors.transparent;
          this.isValidate_4 =  arr[3] == null ? Colors.red : Colors.transparent;
          this.isValidate_5 =  arr[4] == null ? Colors.red : Colors.transparent;
          this.isValidate_6 =  arr[5] == '' ? Colors.red : Colors.transparent;
          });
        }
        return isValied;
      }
      return  Scaffold(
        appBar: AppBar(
          title: Text('청약가점 계산'),
          backgroundColor: ThemeColors("red").rgb,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
        body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0.0),
          child:  Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '무주택기간',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: this.isValidate_1, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButton(
                      underline: SizedBox(),
                      isExpanded: true,
                      value: homeLessPeriod,
                      hint: Text('무주택기간 선택'),
                      items: HomelessPeriodList.getHomelessPeriod().map((                 HomelessPeriodList period){
                        return DropdownMenuItem<int>(
                          value: period.score,
                          child: Text(period.period),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          this.homeLessPeriod = val;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: SizedBox(
                      height: 50,
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomelessPeriod()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                          color: ThemeColors("red").rgb,
                          child:  Text("무주택 기간 계산하러 가기"),
                        ),
                      )
                      
                  )
                ),
                Divider(color: const Color(0xFF000000),),
                Text(
                  '부양가족수 (본인제외)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 15.0, 0.0, 0.0),
                  child: Table(
                    // border: TableBorder.all(width: 1, color: Colors.black),
                    columnWidths: {
                      0:FlexColumnWidth(0.7),
                      1:FlexColumnWidth(1),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("배우자"),
                              ]
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: this.isValidate_2, style: BorderStyle.solid, width: 0.80),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Radio(groupValue: partner, value: 1, onChanged: (val){
                                    setState(() {
                                      this.partner = val;
                                    });
                                  }),
                                  GestureDetector(
                                    child: Text("있음"),
                                    onTap: (){
                                      setState(() {
                                        this.partner = 1;
                                      });
                                    },
                                  ),
                                  Radio(groupValue: partner, value: 0, onChanged: (val){
                                    setState(() {
                                      this.partner = val;
                                    });
                                  }),
                                  GestureDetector(
                                    child: Text("없음"),
                                    onTap: (){
                                        setState(() {
                                          this.partner = 0;
                                        });
                                      },
                                    )
                                ]
                              ),
                            ),
                          ),
                        ]
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("본인의 직계가족"),
                              ]
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: this.isValidate_3, style: BorderStyle.solid, width: 0.80),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  DropdownButton(
                                    underline: SizedBox(),
                                    value: people_1,
                                    hint: Text('인원선택'),
                                    items: PeopleCountList.getPeopleConutList().map((PeopleCountList people){
                                      return DropdownMenuItem<int>(
                                        value: people.count,
                                        child:Text(people.peopleCount)
                                      );
                                    }).toList(),
                                    onChanged: (val){
                                      setState(() {
                                        this.people_1 = val;
                                      });
                                    },
                                  )
                                ]
                              ),
                            ),
                          )
                        ]
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("배우자의 직계존속"),
                              ]
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: this.isValidate_4, style: BorderStyle.solid, width: 0.80),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  DropdownButton(
                                    underline: SizedBox(),
                                    value: people_2,
                                    hint: Text('인원선택'),
                                    items: PeopleCountList.getPeopleConutList().map((PeopleCountList people){
                                      return DropdownMenuItem<int>(
                                        value: people.count,
                                        child:Text(people.peopleCount)
                                      );
                                    }).toList(),
                                    onChanged: (val){
                                      setState(() {
                                        this.people_2 = val;
                                      });
                                    },
                                  )
                                ]
                              ),
                            ),
                          )
                        ]
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("직계비속"),
                              ]
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: this.isValidate_5, style: BorderStyle.solid, width: 0.80),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  DropdownButton(
                                    value: this.people_3,
                                    underline: SizedBox(),
                                    hint: Text('인원선택'),
                                    items: PeopleCountList.getPeopleConutList().map((PeopleCountList people){
                                      return DropdownMenuItem<int>(
                                        value: people.count,
                                        child:Text(people.peopleCount)
                                      );
                                    }).toList(),
                                    onChanged: (val){
                                      setState(() {
                                        this.people_3 = val; 
                                      });
                                    },
                                  )
                                ]
                              ),
                            ),
                          )
                        ]
                      ),
                    ],
                  ),
                ),
                Divider(color: const Color(0xFF000000),),

                Text(
                  '청약통장가입일',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: this.isValidate_6, style: BorderStyle.solid, width: 0.80),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () async => {
                          pickedDate = await DatePicker.selectDate(context),
                          this._dateScore = SubscriptionDateScore(selectedDate: pickedDate),
                          setState(()  {
                            this.subscriptionAccount = pickedDate;
                            this.accountScore = this._dateScore.score;
                          }),
                          
                        },
                        iconSize: 20.0,
                        color: const Color(0xFF000000),
                      ),
                      GestureDetector(
                        child: Text(subscriptionAccount),
                        onTap: () async => {
                          pickedDate = await DatePicker.selectDate(context),
                          this._dateScore = SubscriptionDateScore(selectedDate: pickedDate),
                          setState(()  {
                            this.subscriptionAccount = pickedDate;
                            this.accountScore = this._dateScore.score;
                          }),
                        },
                      )
                    ],
                  ),
                ),

                Divider(color: const Color(0xFF000000),),
                Center(
                  child: SizedBox(
                      height: 50,
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            var validation = [this.homeLessPeriod, this.partner, this.people_1, this.people_2, this.people_3, this.pickedDate];
                            if (!_validationCheck(validation)) return false;

                            this.numOfDependents = NumOfDependents(partner:this.partner, people_1: this.people_1, people_2: this.people_2, people_3: this.people_3);
                            this._numOfDependents = numOfDependents.score;
                            this._totalScore = TotalAdditionalPoint(homeLessPeriod: this.homeLessPeriod, numOfDependents: this._numOfDependents, accountScore: this.accountScore);
                            print(this._totalScore.totalScore);
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Result(this.homeLessPeriod,this._numOfDependents, this.accountScore, this._totalScore.totalScore)),
                            );
                          },
                          color: ThemeColors("red").rgb,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),                          
                          child:  Text("계산하기"),
                        ),
                      ),
                  ),
                ),
                Divider(color: const Color(0xFF000000),),
                Text(
                  '적용기준 확인하기',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Table(
                  // border: TableBorder.all(width: 1, color: Colors.black),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: ThemeColors("red").rgb,width: 2.5)
                                ),
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => LayerPopup.popup(context, '주택소유여부', homeOwner()),
                                  );
                                },
                                child:  Text('주택소유여부'),
                              ),
                            ],
                          ) ,
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: ThemeColors("red").rgb,width: 2.5)
                                ),
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => LayerPopup.popup(context, '무주택기간', homelessPeriod()),
                                  );
                                },
                                child:  Text('무주택기간'),
                              ),
                            ],
                          ) ,
                        )
                      ]
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: ThemeColors("red").rgb,width: 2.5)
                                ),
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => LayerPopup.popup(context, '부양가족수', numOfFamily()),
                                  );
                                },
                                child:  Text('부양가족수'),
                              ),
                            ],
                          ) ,
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: ThemeColors("red").rgb,width: 2.5)
                                ),
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => LayerPopup.popup(context, '청약통장 가입일', createAccountDate()),
                                  );
                                },
                                child:  Text('청약통장 가입일'),
                              ),
                            ],
                          ) ,
                        )
                      ]
                    )
                  ],
                ),
                ]
              ),
            )
          )
        );
      }
  }
  
