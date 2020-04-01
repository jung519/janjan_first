import 'package:flutter/material.dart';

// datePicker
class DatePicker {
  final context;
  DatePicker(this.context);

  static  Future selectDate(context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1980),
        lastDate: new DateTime(2030)
    );
    if (picked == null) return '';

    return '${picked.year}-${picked.month}-${picked.day}';
  }
}

// colors
class ThemeColors {
  final selectedColor;

  Color get rgb {
    switch (this.selectedColor) {
      case "red":
        return Color.fromRGBO(255, 153, 153, 1);
      case "orange":
        return Color.fromRGBO(255, 204, 153, 1);
      case "yellow":
        return Color.fromRGBO(255, 255, 153, 1);
      case "green":
        return Color.fromRGBO(204, 255, 153, 1);
      default:
    }
  }

  ThemeColors(this.selectedColor);
}

// popup
class LayerPopup {
  final context;
  String title = '';
  Widget body;
  LayerPopup(this.context, this.title, this.body);

  static Widget popup(BuildContext context, String title, Widget body) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          body
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('확인'),
        ),
      ],
    );
  }
}

