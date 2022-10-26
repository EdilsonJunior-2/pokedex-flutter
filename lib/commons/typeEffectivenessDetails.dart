import 'package:flutter/material.dart';
import 'package:pokedex/commons/grid.dart';
import 'package:pokedex/commons/typeBox.dart';

import 'package:pokedex/pages/type_colors.dart';
import 'package:pokedex/helpers/schemas.dart';

class TypeEffectivenessDetails extends StatefulWidget {
  TypeEffectivenessDetails(
      {Key? key,
      required this.titleColor,
      required this.title,
      required this.function,
      required this.list})
      : super(key: key);

  final Color titleColor;
  final String title;
  final Function(int index) function;
  final List<OptionsList> list;

  @override
  _TypeEffectivenessDetailsState createState() =>
      _TypeEffectivenessDetailsState();
}

class _TypeEffectivenessDetailsState extends State<TypeEffectivenessDetails> {
  gridElements() {
    List<Container> elements = [];
    for (int i = 0; i < widget.list.length; i++) {
      elements.add(
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * (.15/6),
            right: MediaQuery.of(context).size.width * (.15/6),
            top: 10
          ),
          child: TypeBox(
            bgColor: returnColor(widget.list[i].name),
            text: widget.list[i].name,
            function: () {
              widget.function(i);
            },
          ),
        ),
      );

    }
    return elements;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              color: widget.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Grid(
                  elements: [...gridElements()],
                  elementsPerLine:
                      3)
              ),
        ],
      ),
    );
  }
}
