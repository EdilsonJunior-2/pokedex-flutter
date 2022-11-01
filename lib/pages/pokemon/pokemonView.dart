import 'package:flutter/material.dart';
import 'package:pokedex/commons/customTopBar.dart';
import 'package:pokedex/commons/scrollableContainer.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_repo.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/pokemon/commons/pokemonExpansionPanelItems.dart';
import 'package:pokedex/pages/pokemon/commons/pokemonTypes.dart';
import 'package:pokedex/pages/pokemon/commons/stats.dart';
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
        create: (context) => PokemonCubit(
          repository: PokemonRepo(),
        )..getPokemon(widget.url),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<PokemonCubit, StateClass>(
            builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return error(context, "pokemon");
              } else if (state is LoadedStatePokemon) {
                final pokemon = state.element;
                final textColor = Colors.white;
                final double textSize = 18;
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                      ),
                      child: CustomTopBar(title: widget.name, color: textColor),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 110,
                      child: ScrollableContainer(
                        container: Container(
                          child: Column(
                            children: [
                              Image.network(
                                pokemon.imageUrl,
                                width: 120,
                              ),
                              PokemonTypes(typeList: pokemon.types),
                              Container(
                                width: MediaQuery.of(context).size.width * .9,
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .05,
                                  right:
                                      MediaQuery.of(context).size.width * .05,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  pokemon.flavorTextEntry,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: textSize,
                                    color: textColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .9,
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .05,
                                  right:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                                child: Stats(
                                  statsList: pokemon.stats,
                                  textColor: returnColor(pokemon.types[0].name),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .9,
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .05,
                                  right:
                                      MediaQuery.of(context).size.width * .05,
                                  bottom: 30,
                                ),
                                child: MovesAbilities(
                                  movesList: pokemon.moves,
                                  abilitiesList: pokemon.abilities,
                                  varietyList: pokemon.varietyList,
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
