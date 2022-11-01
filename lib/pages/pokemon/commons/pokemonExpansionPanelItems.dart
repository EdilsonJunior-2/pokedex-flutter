import 'package:flutter/material.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/pages/pokemon/commons/pokemonAbilities.dart';
import 'package:pokedex/pages/pokemon/commons/pokemonMoves.dart';
import 'package:pokedex/pages/pokemon/commons/pokemonVarieties.dart';

class MovesAbilities extends StatefulWidget {
  MovesAbilities(
      {Key? key,
      required this.movesList,
      required this.abilitiesList,
      required this.varietyList})
      : super(key: key);

  final List<OptionsList> movesList;
  final List<OptionsList> abilitiesList;
  final List<Variety> varietyList;
  @override
  _MovesAbilitiesState createState() => _MovesAbilitiesState();
}

class _MovesAbilitiesState extends State<MovesAbilities> {
  List<bool> _isOpen = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.all(0),
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
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
          body: PokemonMoves(list: widget.movesList),
          isExpanded: _isOpen[0],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
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
          body: PokemonAbilities(list: widget.abilitiesList),
          isExpanded: _isOpen[1],
        ),
        ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isOpen) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Varieties",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            },
            isExpanded: _isOpen[2],
            body: Varieties(
              varietyList: widget.varietyList,
            )),
      ],
      expansionCallback: (i, isOpen) => setState(() => _isOpen[i] = !isOpen),
    );
  }
}
