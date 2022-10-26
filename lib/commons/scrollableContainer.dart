import 'package:flutter/material.dart';

class ScrollableContainer extends StatefulWidget {
  ScrollableContainer({Key? key, required this.container}) : super(key: key);

  final Container container;
  @override
  _ScrollableContainerState createState() => _ScrollableContainerState();
}

class _ScrollableContainerState extends State<ScrollableContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder:(context, index) => widget.container,
    );
  }
}
