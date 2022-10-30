import 'package:flutter/material.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/pages/moves/move.dart';
import 'package:pokedex/helpers/utils.dart';

class MovesAbilities extends StatefulWidget {
  MovesAbilities(
      {Key? key, required this.movesList, required this.abilitiesList})
      : super(key: key);

  final List<OptionsList> movesList;
  final List<OptionsList> abilitiesList;
  @override
  _MovesAbilitiesState createState() => _MovesAbilitiesState();
}

class _MovesAbilitiesState extends State<MovesAbilities> {
  listContainer(List<OptionsList> list) {
    return Container(
      height: (list.length * 42),
      constraints: BoxConstraints(
        maxHeight: 250,
      ),
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Move(
                      url: list[index].url,
                      name: list[index].name,
                    ),
                  ),
                );
              },
              child: Text(
                list[index].name.toTitleCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<bool> _isOpen = [false, false];
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      children: [
        ExpansionPanel(
          headerBuilder: (context, isOpen) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(

                children: [
                  Text(
                    "Moves",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          },
          body: listContainer(widget.movesList),
          isExpanded: _isOpen[0],
        ),
        ExpansionPanel(
            headerBuilder: (context, isOpen) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Abilities",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            },
            body: listContainer(widget.abilitiesList),
            isExpanded: _isOpen[1]),
      ],
      expansionCallback: (i, isOpen) => setState(() => _isOpen[i] = !isOpen),
    );
  }
}
