import 'package:flutter/material.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/type_list/type_list_repo.dart';
import 'package:pokedex/cubit/type_list/type_list_cubit.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:pokedex/pages/type_colors.dart';
import 'package:pokedex/pages/types/type.dart';
import 'package:pokedex/functions.dart';

class TypeListPage extends StatefulWidget {
  TypeListPage({Key? key}) : super(key: key);

  @override
  _TypeListPageState createState() => _TypeListPageState();
}

class ColorList {
  const ColorList({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}

class _TypeListPageState extends State<TypeListPage> {



  List<TypeListModel> types = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA8A878),
        title: Text("Types"),
      ),
      body: Column(
        children: <Widget>[
          BlocProvider<TypeListCubit>(
            create: (context) => TypeListCubit(repository: TypeListRepo())
              ..getTypes('https://pokeapi.co/api/v2/type'),
            child: BlocBuilder<TypeListCubit, StateClass>(
                builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return Center(
                  child: Icon(Icons.close),
                );
              } else if (state is LoadedStateTypeList) {
                types = state.element;
                return Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120,
                            childAspectRatio: 5 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                        ),
                        itemCount: types.length,
                        itemBuilder: (context, index) => Container(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Type(
                                    url: types[index].url,
                                    name: types[index].name,
                                    color: returnColor(types[index].name),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              types[index].name,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: returnColor(types[index].name),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
}
