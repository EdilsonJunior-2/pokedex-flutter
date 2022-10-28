import 'package:flutter/material.dart';
import 'package:pokedex/helpers/utils.dart';

class CustomTopBar extends StatefulWidget {
  CustomTopBar({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;
  @override
  _CustomTopBarState createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
            top: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .15,
                margin: EdgeInsets.all(0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  color: Colors.white,
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                alignment: Alignment.center,
                child:  Text(
                  widget.title.toTitleCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: widget.color,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            bottom: 20,
          ),
          color: widget.color,
        ),
      ],
    );
  }
}
