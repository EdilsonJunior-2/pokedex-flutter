import 'package:flutter/material.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/pages/abilities/ability.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/abilities/abilities_repo.dart';
import 'package:pokedex/cubit/abilities/abilities_cubit.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:pokedex/functions.dart';

class AbilitiesPage extends StatefulWidget {
  AbilitiesPage({Key? key}) : super(key: key);

  @override
  _AbilitiesPageState createState() => _AbilitiesPageState();
}

class _AbilitiesPageState extends State<AbilitiesPage> {
  late List<OptionsList> abilities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF78C850),
        title: Text("Abilities"),
      ),
      body: Column(
        children: <Widget>[
          BlocProvider<AbilitiesCubit>(
            create: (context) => AbilitiesCubit(repository: AbilitiesRepo())
              ..getAbilities(
                  'https://pokeapi.co/api/v2/ability?offset=0&limit=327'),
            child: BlocBuilder<AbilitiesCubit, StateClass>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return loading(context);
                } else if (state is ErrorState) {
                  return Center(
                    child: Icon(Icons.close),
                  );
                } else if (state is LoadedStateAbilitiesList) {
                  abilities = state.element;
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: abilities.length,
                      itemBuilder: (context, index) => TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ability(
                                url: abilities[index].url,
                                name: abilities[index].name,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            tileColor: Colors.black45,
                            title: Text(
                              abilities[index].name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
