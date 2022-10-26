import 'package:flutter/material.dart';

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
            height: (widget.list.length * 42 + 40),
            constraints: BoxConstraints(
              maxHeight: 250,
            ),
            width: MediaQuery.of(context).size.width * 0.4,
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            margin: EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: widget.list.length,
              itemBuilder: (context, index) => Container(
                height: 42,
                child: TextButton(
                  onPressed: () {
                    widget.function(index);
                  },
                  child: Text(
                    widget.list[index].name,
                    style: TextStyle(
                      color: returnColor(widget.list[index].name),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
