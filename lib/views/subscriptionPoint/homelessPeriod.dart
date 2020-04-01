import 'package:flutter/material.dart';
import 'package:estate_calculator/common/util.dart';
import 'package:estate_calculator/service/calculate.dart';

/**
 * 입주자 공고일 현제 무주택자여야 함.
 * 30세를 기산점으로 함
 * 만30세 부터 입주자 공고일까지의 날자를 계산.
 * 미혼이고 30세 이하인 경우 0점.
 * 단, 30세 이하인데 결혼한경우 혼인신고한 날을 기산점으로 함
 */

class HomelessPeriod extends StatefulWidget {
  @override
  _HomelessPeriodState createState() => _HomelessPeriodState();
}

class _HomelessPeriodState extends State<HomelessPeriod> {
  bool isMarriage;
  bool isHomeOwner;
  Color isValidate_1 = Colors.transparent;
  Color isValidate_2 = Colors.transparent;
  Color isValidate_3 = Colors.transparent;
  Color isValidate_4 = Colors.transparent;
  Color isValidate_5 = Colors.transparent;
  Color isValidate_6 = Colors.transparent;
  String date_1 = '날자선택';
  String date_2 = '날자선택';
  String date_3 = '날자선택';
  String date_4 = '날자선택';
  String pickedDate = '';
  int durationDay = 0;

  void initState() {
    super.initState();
    print('init?');
  }

  @override
  Widget build(BuildContext context) {
    _validationCheck(arr){
      var isValid = true;
      for(var it in arr){
        if(it == null || it == '날자선택' || it == ''){
          isValid = false;
        }
      }
      if (!isValid) {
        setState(() {
          this.isValidate_1 =  arr[0] == '날자선택' || arr[0] == '' ? Colors.red : Colors.transparent;
          this.isValidate_2 =  arr[1] == '날자선택' || arr[0] == '' ? Colors.red : Colors.transparent;
          this.isValidate_3 =  arr[2] == null ? Colors.red : Colors.transparent;
          this.isValidate_4 =  arr[3] == '날자선택' || arr[0] == '' ? Colors.red : Colors.transparent;
          this.isValidate_5 =  arr[4] == null ? Colors.red : Colors.transparent;
          this.isValidate_6 =  arr[5] == '날자선택' || arr[5] == '' ? Colors.red : Colors.transparent;
        });
      }
      return isValid;
    }
        return  Scaffold(
          appBar: AppBar(
          title: Text('무주책기간 계산'),
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
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '입주자 모집 공고일',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: this.isValidate_1, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () async => {
                            pickedDate = await DatePicker.selectDate(context),
                            setState(()  {
                              this.date_1 = pickedDate;
                            }),
                          },
                          iconSize: 20.0,
                          color: const Color(0xFF000000),
                        ),
                        Text(date_1),
                      ],
                    ),
                  ),
                  Divider(color: const Color(0xFF000000),),
                  Text(
                    '생년월일 (주민등록번호 기준)',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: this.isValidate_2, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () async => {
                            pickedDate = await DatePicker.selectDate(context),
                            setState(()  {
                              this.date_2 = pickedDate;
                            }),
                          },
                          iconSize: 20.0,
                          color: const Color(0xFF000000),
                        ),
                        Text(date_2),
                      ],
                    ),
                  ),
                  Divider(color: const Color(0xFF000000),),
                  Text(
                    '혼인여부',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: this.isValidate_3, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Column(
                      children: <Widget>[
                        RadioListTile<bool>(
                          title: Text('미혼 (혼인 안함)'),
                          groupValue: isMarriage,
                          value: false,
                          onChanged: (bool val){
                            setState(() {
                              this.isMarriage = val;
                            });
                          },
                        ),
                        RadioListTile<bool>(
                          title: Text('기혼 (혼인함)'),
                          groupValue: isMarriage,
                          value: true,
                          onChanged: (bool val){
                            setState(() {
                              this.isMarriage = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(color: const Color(0xFF000000),),
                  Text(
                    '혼인 신고일',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: this.isValidate_4, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () async => {
                            pickedDate = await DatePicker.selectDate(context),
                            setState(()  {
                              this.date_3 = pickedDate;
                            }),
                          },
                          iconSize: 20.0,
                          color: const Color(0xFF000000),
                        ),
                        Text(date_3),
                      ],
                    ),
                  ),
                  Divider(color: const Color(0xFF000000),),
                  Text(
                    '주택소유여부(본인 및 세대원)',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: this.isValidate_5, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Column(
                      children: <Widget>[
                        RadioListTile<bool>(
                          title: Text('무주택자 (주택 소유한적 없는 경우)'),
                          groupValue: isHomeOwner,
                          value: false,
                          onChanged: (bool val){
                            setState(() {
                              this.isHomeOwner = val;
                            });
                          },
                        ),
                        RadioListTile<bool>(
                          title: Text('과거 주택 소유 (현재 무주택자)'),
                          groupValue: isHomeOwner,
                          value: true,
                          onChanged: (bool val){
                            setState(() {
                              this.isHomeOwner = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '※ 청약신청자의 배우자가 결혼 전 매도한 주택은 제외 ※',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                        // color: Colors.red
                      )
                    ),
                  ),
                  Divider(color: const Color(0xFF000000),),
                  Text(
                    '무주택자가 된 날',
                    style: TextStyle(
                      fontSize: 20,
                    )
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
                            setState(()  {
                              this.date_4 = pickedDate;
                            }),
                          },
                          iconSize: 20.0,
                          color: const Color(0xFF000000),
                        ),
                        Text(date_4),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '※ 가장 최근에 무주택자가 된 날을 선택 ※',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                          // color: Colors.red
                        )
                    ),
                  ),
                  Divider(color: const Color(0xFF000000),),
                  Text('오류입력으로 인한 책임은 본인에게 있음을 확인합니다.'),
                  Table(
                    columnWidths: {
                      0:FlexColumnWidth(1),
                      1:FlexColumnWidth(0.6),
                    },
                    // border: TableBorder.all(width: 1, color: Colors.black),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('결과값'),
                                Text(durationDay.toString()),
                              ],
                            )
                          ),
                          TableCell(
                            child : Column(
                              children: <Widget>[
                                RaisedButton(
                                  color: ThemeColors("red").rgb,
                                  onPressed: (){
                                    var validation = [this.date_1, this.date_2, this.isMarriage, this.date_3, this.isHomeOwner, this.date_4 ];
                                    if (!_validationCheck(validation)) return false;

                                    var _homelessDate = HomelessDate(announcementDate: this.date_1, birthDay: this.date_2, marriageDate: this.date_3, startedHomeless: this.date_4);
                                    var _durationDay = _homelessDate.duration;
                                    setState(() {
                                      this.durationDay = _durationDay;
                                    });
                                  },
                                  child:  Text('계산하기'),
                                ),
                                RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(18.0),
                                    side: BorderSide(color: ThemeColors("red").rgb,width: 2.5)
                                  ),
                                  onPressed: (){ initState(); },
                                  child:  Text('초기화'),
                                ),
                                RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(18.0),
                                    side: BorderSide(color: ThemeColors("red").rgb,width: 2.5)
                                  ),
                                  onPressed: () {Navigator.pop(context);},
                                  child:  Text('돌아가기'),
                                )
                              ],
                            )
                          )
                        ]
                      ),
                    ],
                  ),
          ]
        ),
        ) 
      )
    );
  }
  void radioChanged(double value) {}
}