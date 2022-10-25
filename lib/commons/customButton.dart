import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.bgColor,
      required this.function})
      : super(key: key);

  final String text;
  final Color color;
  final Color bgColor;
  final Function() function;
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.function,
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 20.0, color: widget.color),
      ),
      style: TextButton.styleFrom(
        backgroundColor: widget.bgColor,
      ),
    );
  }
}
