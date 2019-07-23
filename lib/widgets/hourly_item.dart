import 'package:flutter/material.dart';

class HourlyItem extends StatelessWidget {
  HourlyItem({this.iconText, this.time, this.temperature});

  final String iconText;
  final String time;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Text(
            iconText,
            style: TextStyle(fontSize: 40),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            temperature,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
