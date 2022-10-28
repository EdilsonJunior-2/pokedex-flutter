import 'package:flutter/material.dart';

class TypeBox extends StatefulWidget {
  TypeBox(
      {Key? key,
      required this.bgColor,
      required this.text,
      required this.function})
      : super(key: key);

  final Color bgColor;
  final String text;
  final Function() function;
  @override
  _TypeBoxState createState() => _TypeBoxState();
}

class _TypeBoxState extends State<TypeBox> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: widget.function,
      style: TextButton.styleFrom(
          backgroundColor: widget.bgColor,
          primary: Colors.white,
          side: BorderSide(color: Colors.white, width: 1),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
