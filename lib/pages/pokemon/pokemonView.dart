import 'package:flutter/material.dart';
import 'package:pokedex/commons/customTopBar.dart';
import 'package:pokedex/commons/scrollableContainer.dart';
import 'package:pokedex/commons/typeBox.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_repo.dart';
import 'package:pokedex/pages/abilities/ability.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/pokemon/commons/sprites.dart';
import 'package:pokedex/pages/pokemon/commons/stats.dart';
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .05,
              right: MediaQuery.of(context).size.width * .05),
          child: BlocBuilder<PokemonCubit, StateClass>(
            builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return error(context, "pokemon");
              } else if (state is LoadedStatePokemon) {
                final pokemon = state.element;
                final textColor = returnColor(pokemon.types[0].name);
                return Column(
                  children: [
                    CustomTopBar(title: widget.name, color: textColor),
                    Container(
                      height: MediaQuery.of(context).size.height - 101,
                      child: ScrollableContainer(
                        container: Container(
                          child: Column(
                            children: [
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
                                                color: textColor,
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                                ),
                              ),
                              Stats(
                                  statsList: pokemon.stats,
                                  textColor: textColor),
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
                              Sprites(pokemonNumber: getPokemonNumber(widget.url).toString()),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 30,
                                  left: 20.0,
                                  right: 20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          height:
                                              (pokemon.moves.length * 42 + 40),
                                          constraints: BoxConstraints(
                                            maxHeight: 250,
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
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
                                            itemBuilder: (context, index) =>
                                                Container(
                                              height: 42,
                                              alignment: Alignment.center,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Move(
                                                        url: pokemon
                                                            .moves[index].url,
                                                        name: pokemon
                                                            .moves[index].name,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  pokemon.moves[index].name
                                                      .toTitleCase(),
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
                                          height:
                                              (pokemon.abilities.length * 42 +
                                                  40),
                                          constraints: BoxConstraints(
                                            maxHeight: 250,
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          color: Colors.white,
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 20,
                                          ),
                                          margin:
                                              const EdgeInsets.only(top: 20.0),
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: pokemon.abilities.length,
                                            padding: EdgeInsets.all(0),
                                            itemBuilder: (context, index) =>
                                                Container(
                                              height: 42,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Ability(
                                                        url: pokemon
                                                            .abilities[index]
                                                            .url,
                                                        name: pokemon
                                                            .abilities[index]
                                                            .name,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  pokemon.abilities[index].name
                                                      .toTitleCase(),
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
                        ),
                      ),
                    ),
                  ],
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
