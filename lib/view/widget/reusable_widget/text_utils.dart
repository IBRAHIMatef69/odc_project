import 'package:flutter/material.dart';

class KTextWidget extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight:fontWeight ,
         ),);
  }

  KTextWidget({
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
   });
}
