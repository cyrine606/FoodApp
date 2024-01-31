import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final double size;
  final String text;
  CustomText({@required this.text,this.size});
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontSize: this.size,
    ),);
  }
}
