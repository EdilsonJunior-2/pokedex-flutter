import 'package:flutter/material.dart';
import 'package:pokedex/store/links.dart';

class Sprites extends StatefulWidget {
  Sprites({Key? key, required this.pokemonNumber}) : super(key: key);

  final String pokemonNumber;
  @override
  _SpritesState createState() => _SpritesState();
}

class _SpritesState extends State<Sprites> {
  @override
  Widget build(BuildContext context) {
    final widthQuery = MediaQuery.of(context).size.width;
    return Container(
      width: widthQuery * .9,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              right: widthQuery * .1
            ),
            child: Column(
              children: [
                Text(
                  'Default',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                Image.network(
                  pokemonImageLink + "/other/home/" + widget.pokemonNumber + ".png",
                  width: 100,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: widthQuery * .1
            ),
            child: Column(
              children: [
                Text(
                  'Shiny',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                Image.network(
                  pokemonImageLink + "/other/home/shiny/" + widget.pokemonNumber + ".png",
                  width: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
