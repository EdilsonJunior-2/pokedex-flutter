import 'package:flutter/cupertino.dart';

class Grid extends StatefulWidget {
  Grid({Key? key, required this.elements, required this.elementsPerLine})
      : super(key: key);

  final List<Container> elements;
  final int elementsPerLine;
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  columns(int start, int end) {
    List<Column> columnsList = [];
    for (int j = 0; j < widget.elementsPerLine; j++) {
      if (j + start < widget.elements.length) {
        columnsList.add(Column(
          children: <Widget>[widget.elements[j + start]],
        ));
      }
    }
    return columnsList;
  }

  rows() {
    List<Row> rowsList = [];
    var size = widget.elements.length / widget.elementsPerLine;
    for (int i = 0; size.truncate() >= i; i++) {
      rowsList.add(
          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.max, children: <Widget>[
        ...columns(widget.elementsPerLine * i, widget.elementsPerLine * (i + 1))
      ]));
    }
    return rowsList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[...rows()]);
  }
}
