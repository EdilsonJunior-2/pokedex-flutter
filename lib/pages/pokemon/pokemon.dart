import 'package:flutter/material.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_repo.dart';
import 'package:pokedex/pages/abilities/ability.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/types/type.dart';
import 'package:pokedex/pages/moves/move.dart';

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
      appBar: AppBar(
          title: Text(widget.name)),
      body: BlocProvider<PokemonCubit>(
        create: (context) =>
            PokemonCubit(repository: PokemonRepo())..getPokemon('https://pokeapi.co/api/v2/pokemon/${widget.name}'),
        child: SingleChildScrollView(
          child: BlocBuilder<PokemonCubit, StateClass>(
            builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return Center(
                  child: Text(
                    "There is no info about this pokemon in our database, sorry :(",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                );
              } else if (state is LoadedStatePokemon) {
                final pokemon = state.element;
                return Center(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 20.0),
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Text(
                            "Types:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          height: (pokemon.types.length * 42 + 40),
                          constraints: BoxConstraints(
                            maxHeight: 124,
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(top: 20.0, bottom: 20),
                          child: ListView.builder(
                            itemCount: pokemon.types.length,
                            itemBuilder: (context, index) => Container(
                              height: 42,
                              child: TextButton(
                                onPressed: () {
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
                                child: Text(
                                  pokemon.types[index].name,
                                  style: TextStyle(
                                    color:
                                        returnColor(pokemon.types[index].name),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Text(
                            "Moves:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          height: (pokemon.moves.length * 42 + 40),
                          constraints: BoxConstraints(
                            maxHeight: 250,
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(top: 20.0),
                          child: ListView.builder(
                            itemCount: pokemon.moves.length,
                            itemBuilder: (context, index) => Container(
                              height: 42,
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
                                child: Text(pokemon.moves[index].name),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Text(
                            "Abilities:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          height: (pokemon.abilities.length * 42 + 40),
                          constraints: BoxConstraints(
                            maxHeight: 250,
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(top: 20.0),
                          child: ListView.builder(
                            itemCount: pokemon.abilities.length,
                            itemBuilder: (context, index) => Container(
                              height: 42,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Ability(
                                        url: pokemon.abilities[index].url,
                                        name: pokemon.abilities[index].name,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(pokemon.abilities[index].name),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
