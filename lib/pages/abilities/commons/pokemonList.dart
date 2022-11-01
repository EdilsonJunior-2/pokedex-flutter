import 'package:flutter/material.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/pages/pokemon/pokemonView.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key, required this.pokemonList, required this.title})
      : super(key: key);

  final List<OptionsList> pokemonList;
  final String title;
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            bottom: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .7,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.pokemonList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.zero,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pokemon(
                          url: widget.pokemonList[index].url,
                          name: widget.pokemonList[index].name,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      tileColor: Colors.black45,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.pokemonList[index].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Image.network(
                            hasString(widget.pokemonList[index].image),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
