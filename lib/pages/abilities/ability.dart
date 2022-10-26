import 'package:flutter/material.dart';
import 'package:pokedex/cubit/ability/ability_cubit.dart';
import 'package:pokedex/cubit/ability/ability_repo.dart';
import 'package:pokedex/pages/pokemon/pokemon.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/functions.dart';
import 'package:pokedex/pages/generation_colors.dart';
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
        child: SingleChildScrollView(
          child: BlocBuilder<AbilityCubit, StateClass>(
            builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return error(context, 'ability');
              } else if (state is LoadedStateAbility) {
                final ability = state.element;
                return Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        appBarUsingGeneration(context, widget.name.toTitleCase(), ability.generation), //TODO: Change this function into a new common
                        Text(
                          ability.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: returnColorByGeneration(
                              ability.generation,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Text(
                            "Pokemon that might have this ability:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: returnColorByGeneration(
                                ability.generation,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: (ability.listOfPokemon.length * 30 + 40),
                          constraints: BoxConstraints(
                            maxHeight: 250,
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(top: 20.0, bottom: 20),
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: ability.listOfPokemon.length,
                            itemBuilder: (context, index) => Container(
                              height: 30,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Pokemon(
                                        url: ability.listOfPokemon[index].url,
                                        name: ability
                                            .listOfPokemon[index].name,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  ability.listOfPokemon[index].name.toTitleCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: returnColorByGeneration(
                                      ability.generation,
                                    ),
                                  ),
                                ),
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
