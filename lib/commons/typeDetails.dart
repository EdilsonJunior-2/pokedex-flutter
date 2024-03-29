import 'package:flutter/material.dart';
import 'package:pokedex/pages/type_colors.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/helpers/utils.dart';

class TypeDetails extends StatefulWidget {
  TypeDetails({
    Key? key,
    required this.typeName,
    required this.listName,
    required this.color,
    required this.optionsList,
    required this.function
  }) : super(key: key);

  final String typeName;
  final String listName;
  final Color color;
  final List<OptionsList> optionsList;
  final Function(int index) function;
  @override
  _TypeDetailsState createState() => _TypeDetailsState();
}

class _TypeDetailsState extends State<TypeDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Text(
        '${widget.listName}',
        style: TextStyle(
          color: returnColor(widget.typeName),
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        height: (widget.optionsList.length * 42 + 40),
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
          left: MediaQuery.of(context).size.width * 0.025,
          right: MediaQuery.of(context).size.width * 0.025,
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: widget.optionsList.length,
          itemBuilder: (context, index) => Container(
            height: 42,
            child: TextButton(
              onPressed: () {
                widget.function(index);
              },
              child: Text(
                widget.optionsList[index].name.toTitleCase(),
                style: TextStyle(
                  color: returnColor(widget.typeName),
                ),
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
