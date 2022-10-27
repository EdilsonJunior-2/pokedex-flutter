import 'package:flutter/material.dart';

class StrokeText extends StatefulWidget {
  StrokeText(
      {Key? key,
      required this.text,
      required this.textSize,
      required this.strokeColor,
      required this.textColor})
      : super(key: key);

  final String text;
  final double textSize;
  final Color strokeColor;
  final Color textColor;

  @override
  _StrokeTextState createState() => _StrokeTextState();
}

class _StrokeTextState extends State<StrokeText> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: widget.textSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = widget.strokeColor,
          ),
        ),
        Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: widget.textSize,
            fontWeight: FontWeight.bold,
            color: widget.textColor,
          ),
        ),
      ],
    );
  }
}
