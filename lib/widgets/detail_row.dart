import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  DetailRow({@required this.label, this.value});

  final String label;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(label),
          ),
          Expanded(
            child: Text(value.toString()),
          ),
        ],
      ),
    );
  }
}
