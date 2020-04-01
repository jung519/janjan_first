import 'package:flutter/material.dart';
import 'package:estate_calculator/common/util.dart';
import '../home.dart';

class Result extends StatelessWidget {
  int homeLessPeriod;
  int numOfDependents;
  int accountCreatedDate;
  int totalScore = 0;

  Result(this.homeLessPeriod, this.numOfDependents, this.accountCreatedDate, this.totalScore, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(0.0),
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '청약가점 점수확인',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10.0),
            Table(
            border: TableBorder.all(width: 0.5, color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0:FlexColumnWidth(0.6),
              1:FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: [
                    TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          Text('항목', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                    TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Text('점수/만점 (선택항목)', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ]
              ),
              
              TableRow(
                children: [
                    TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Text('무주택기간'),
                      ],
                    ),
                  ),
                    TableCell(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Text(homeLessPeriod.toString() + '점'),
                        Text('(5년이상~ 6년미만)'),
                        SizedBox(height: 10.0),
                      ],
                    )
                  ),
                ]
              ),
                TableRow(
                children: [
                    TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Text('부양가족수'),
                      ],
                    ),
                  ),
                    TableCell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          SizedBox(height: 10.0),
                          Text(numOfDependents.toString() + '점'),
                          Text('(1명)'),
                          SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ]
              ),
                TableRow(
                children: [
                    TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Text('청약통장\n가입기간'),
                      ],
                    ),
                  ),
                    TableCell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          SizedBox(height: 10.0),
                          Text(accountCreatedDate.toString() + '점'),
                          Text('(6년이상 ~ 7년미만)'),
                          SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ]
              ),
                TableRow(
                children: [
                    TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Text('합계'),
                      ],
                    ),
                  ),
                    TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Text('$totalScore/84점'),
                      ],
                    ),
                  ),
                ]
              )
            ],
          ),
          SizedBox(height: 30.0),
          Table(
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)
                      ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child:  Text('홈으로'),
                    ),
                  ),
                  TableCell(
                    child: RaisedButton(
                      color:  ThemeColors("red").rgb,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: new BorderRadius.circular(18.0),
                      //   side: BorderSide(color: ThemeColors("red").rgb,width: 2.5)
                      // ),
                      onPressed: () {Navigator.pop(context);},
                      child:  Text('다시 계산하기'),
                    )
                  ),
                ]
              )
            ],
          )
          ],
        ),
        )
      ),
    );
  }
}