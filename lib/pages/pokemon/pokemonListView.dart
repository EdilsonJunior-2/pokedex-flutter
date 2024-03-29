import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/cubit/state.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_repo.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_cubit.dart';

import 'package:pokedex/pages/pokemon/pokemonView.dart';

import 'package:pokedex/functions.dart';

class PokemonListGenerationPage extends StatefulWidget {
  PokemonListGenerationPage(
      {Key? key,
      required this.url,
      required this.generation,
      required this.color})
      : super(key: key);

  final String url;
  final String generation;
  final Color color;

  @override
  _PokemonListGenerationPageState createState() =>
      _PokemonListGenerationPageState();
}

class _PokemonListGenerationPageState extends State<PokemonListGenerationPage> {
  late List<OptionsList> pokemonList;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.generation),
      ),
      body: Column(
        children: <Widget>[
          BlocProvider<PokemonListCubit>(
            create: (context) => PokemonListCubit(repository: PokemonListRepo())
              ..getPokemon(widget.url),
            child: BlocBuilder<PokemonListCubit, StateClass>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return loading(context);
                } else if (state is ErrorState) {
                  return Center(
                    child: Icon(Icons.close),
                  );
                } else if (state is LoadedStatePokemonList) {
                  pokemonList = state.element;
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: pokemonList.length,
                      itemBuilder: (context, index) => TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pokemon(
                                url: pokemonList[index].url,
                                name: pokemonList[index].name,
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
                                  pokemonList[index].name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Image.network(
                                    hasString(pokemonList[index].image))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
