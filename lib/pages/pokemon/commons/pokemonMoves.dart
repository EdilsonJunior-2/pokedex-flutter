import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/pages/moves/move.dart';
import 'package:pokedex/helpers/utils.dart';

class PokemonMoves extends StatefulWidget {
  PokemonMoves({Key? key, required this.list}) : super(key: key);

  final List<OptionsList> list;
  @override
  _PokemonMovesState createState() => _PokemonMovesState();
}

class _PokemonMovesState extends State<PokemonMoves> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.list.length * 70,
      constraints: BoxConstraints(
        maxHeight: 250,
      ),
      margin: EdgeInsets.only(top: 0),
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              tileColor: Colors.black45,
              title: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Move(
                        url: widget.list[index].url,
                        name: widget.list[index].name,
                      ),
                    ),
                  );
                },
                child: Text(
                  widget.list[index].name.toTitleCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
