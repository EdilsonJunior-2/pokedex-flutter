import 'package:flutter/material.dart';
import 'package:pokedex/commons/customTopBar.dart';
import 'package:pokedex/commons/scrollableContainer.dart';
import 'package:pokedex/cubit/ability/ability_cubit.dart';
import 'package:pokedex/cubit/ability/ability_repo.dart';
import 'package:pokedex/pages/abilities/commons/pokemonList.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/functions.dart';
import 'package:pokedex/helpers/utils.dart';

class Ability extends StatefulWidget {
  Ability({Key? key, required this.url, required this.name}) : super(key: key);

  final String url;
  final String name;

  @override
  _AbilityState createState() => _AbilityState();
}

class _AbilityState extends State<Ability> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AbilityCubit>(
        create: (context) =>
            AbilityCubit(repository: AbilityRepo())..getAbility(widget.url),
        child: BlocBuilder<AbilityCubit, StateClass>(
          builder: (context, state) {
            if (state is LoadingState) {
              return loading(context);
            } else if (state is ErrorState) {
              return error(context, 'ability');
            } else if (state is LoadedStateAbility) {
              final ability = state.element;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05,
                    ),
                    child: CustomTopBar(
                        title: widget.name.toTitleCase(), color: Colors.white),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 110,
                    child: ScrollableContainer(
                      container: Container(
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .05,
                              right: MediaQuery.of(context).size.width * .05,
                              bottom: 20,
                            ),
                            child: Text(
                              ability.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .05,
                              right: MediaQuery.of(context).size.width * .05,
                            ),
                            child: PokemonList(
                              title:
                                  "Pokemon with ${ability.name.toTitleCase()}",
                              pokemonList: ability.listOfPokemon,
                            ),
                          ),
                        ]),
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
    );
  }
}
