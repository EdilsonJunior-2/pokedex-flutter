import 'package:flutter/material.dart';
import 'package:pokedex/commons/customTopBar.dart';
import 'package:pokedex/commons/typeBox.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_repo.dart';
import 'package:pokedex/pages/abilities/ability.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/types/type.dart';
import 'package:pokedex/pages/moves/move.dart';
import 'package:pokedex/helpers/utils.dart';

import 'package:pokedex/functions.dart';
import 'package:pokedex/pages/type_colors.dart';

class Pokemon extends StatefulWidget {
  Pokemon({Key? key, required this.url, required this.name}) : super(key: key);

  final String url;
  final String name;

  @override
  _PokemonState createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PokemonCubit>(
        create: (context) =>
            PokemonCubit(repository: PokemonRepo())..getPokemon(widget.url),
        child: SingleChildScrollView(
          child: BlocBuilder<PokemonCubit, StateClass>(
            builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return error(context, "pokemon");
              } else if (state is LoadedStatePokemon) {
                final pokemon = state.element;
                final statsOrder = [0, 5, 1, 2, 3, 4];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05),
                  child: Column(
                    children: [
                      CustomTopBar(
                          title: widget.name,
                          color: returnColor(pokemon.types[0].name)),
                      Image.network(
                        pokemon.imageUrl,
                        width: 120,
                      ),
                      Container(
                        height: (pokemon.types.length * 42),
                        width: MediaQuery.of(context).size.width * 0.3,
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pokemon.types.length,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) => Container(
                              height: 30,
                              margin: EdgeInsets.only(bottom: 10),
                              child: TypeBox(
                                bgColor: returnColor(
                                  pokemon.types[index].name,
                                ),
                                text: pokemon.types[index].name,
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Type(
                                        url: pokemon.types[index].url,
                                        name: pokemon.types[index].name,
                                        color: returnColor(
                                          pokemon.types[index].name,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ),
                      ),
                      Container(
                        height: 126,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) => Container(
                            height: 42,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: Text(
                                    ("${pokemon.stats[statsOrder[2 * index]].name}: ${pokemon.stats[statsOrder[2 * index]].value}"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: returnColor(
                                        pokemon.types[0].name,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    ("${pokemon.stats[statsOrder[2 * index + 1]].name}: ${pokemon.stats[statsOrder[2 * index + 1]].value}"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: returnColor(
                                        pokemon.types[0].name,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 20,
                          top: 20,
                        ),
                        child: Text(
                          pokemon.flavorTextEntry,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: returnColor(
                              pokemon.types[0].name,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Default',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Shiny',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      Row(
                        children: <Widget>[
                          Image.network(
                            pokemon.spriteUrl,
                            width: 100,
                          ),
                          Image.network(
                            pokemon.spriteUrlShiny,
                            width: 100,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 30,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Text(
                                    "Moves",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: (pokemon.moves.length * 42 + 40),
                                  constraints: BoxConstraints(
                                    maxHeight: 250,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  color: Colors.white,
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: pokemon.moves.length,
                                    itemBuilder: (context, index) => Container(
                                      height: 42,
                                      alignment: Alignment.center,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Move(
                                                url: pokemon.moves[index].url,
                                                name: pokemon.moves[index].name,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          pokemon.moves[index].name.toTitleCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: returnColor(
                                                pokemon.types[0].name),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Text(
                                    "Abilities",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: (pokemon.abilities.length * 42 + 40),
                                  constraints: BoxConstraints(
                                    maxHeight: 250,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  color: Colors.white,
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                  ),
                                  margin: const EdgeInsets.only(top: 20.0),
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: pokemon.abilities.length,
                                    padding: EdgeInsets.all(0),
                                    itemBuilder: (context, index) => Container(
                                      height: 42,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Ability(
                                                url: pokemon
                                                    .abilities[index].url,
                                                name: pokemon
                                                    .abilities[index].name,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          pokemon.abilities[index].name.toTitleCase(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: returnColor(
                                              pokemon.types[0].name,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
