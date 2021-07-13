import 'package:flutter/material.dart';
import 'package:pokedex/cubit/ability/ability_cubit.dart';
import 'package:pokedex/cubit/ability/ability_repo.dart';
import 'package:pokedex/pages/pokemon/pokemon.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/functions.dart';

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
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color(0xFF78C850),
      ),
      body: BlocProvider<AbilityCubit>(
        create: (context) =>
            AbilityCubit(repository: AbilityRepo())..getAbility(widget.url),
        child: SingleChildScrollView(
          child: BlocBuilder<AbilityCubit, StateClass>(
            builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 20.0),
                    child: Text(
                      "An error occurred while getting the info about this ability, or there is no info about it in our database, sorry :(",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                );
              } else if (state is LoadedStateAbility) {
                final ability = state.element;
                return Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          ability.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Text(
                            "Pokemon that might have this ability:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
                                            .listOfPokemon[index].pokemonName,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                    ability.listOfPokemon[index].pokemonName),
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
