import 'package:flutter/material.dart';
import 'package:pokedex/commons/typeDetails.dart';
import 'package:pokedex/cubit/type/type_cubit.dart';
import 'package:pokedex/cubit/type/type_repo.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/functions.dart';
import 'package:pokedex/pages/moves/move.dart';
import 'package:pokedex/pages/type_colors.dart';
import 'package:pokedex/helpers/schemas.dart';
import 'package:pokedex/commons/grid.dart';
import 'package:pokedex/commons/typeEffectivenessDetails.dart';
import 'package:pokedex/commons/customTopBar.dart';
import 'package:pokedex/pages/pokemon/pokemon.dart';

class Type extends StatefulWidget {
  Type({Key? key, required this.url, required this.name, required this.color})
      : super(key: key);

  final String url;
  final String name;
  final Color color;

  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {
  push(int index, List<OptionsList> list) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Type(
          url: list[index].url,
          name: list[index].name,
          color: returnColor(list[index].name),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<TypeCubit>(
        create: (context) =>
            TypeCubit(repository: TypeRepo())..getType(widget.url),
        child: SingleChildScrollView(
          child: BlocBuilder<TypeCubit, StateClass>(
            builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return error(context, "type");
              } else if (state is LoadedStateType) {
                final type = state.element;
                List<ListSchema> listOfLists = [
                  new ListSchema(
                      listName: "${widget.name} pokemon",
                      typeName: type.name,
                      color: returnColor(type.name),
                      optionsList: type.pokemon,
                      function: (index) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Pokemon(
                              url: type.pokemon[index].url,
                              name: type.pokemon[index].name,
                            ),
                          ),
                        );
                      }),
                  new ListSchema(
                      listName: '${widget.name} moves',
                      typeName: type.name,
                      color: returnColor(type.name),
                      optionsList: type.moves,
                      function: (index) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Move(
                              url: type.moves[index].url,
                              name: type.moves[index].name,
                            ),
                          ),
                        );
                      })
                ];
                return Container(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                        bottom: 20.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          CustomTopBar(
                            title: "${widget.name} type",
                            color: returnColor(widget.name),
                          ),
                          Grid(elements: [
                            Container(
                              child: TypeDetails(
                                  typeName: listOfLists[0].typeName,
                                  listName: listOfLists[0].listName,
                                  color: listOfLists[0].color,
                                  optionsList: listOfLists[0].optionsList,
                                  function: listOfLists[0].function),
                            ),
                            Container(
                                child: TypeDetails(
                                    typeName: listOfLists[1].typeName,
                                    listName: listOfLists[1].listName,
                                    color: listOfLists[1].color,
                                    optionsList: listOfLists[1].optionsList,
                                    function: listOfLists[1].function))
                          ], elementsPerLine: 2),
                          Grid(
                            elements: [
                              Container(
                                  child: TypeEffectivenessDetails(
                                      titleColor: Colors.green,
                                      title: 'Super Effective',
                                      function: (int index) {
                                        push(index, type.doubleDamageTo);
                                      },
                                      list: type.doubleDamageTo)),
                              Container(
                                  child: TypeEffectivenessDetails(
                                titleColor: Colors.red,
                                title: 'Half Effective',
                                function: (int index) {
                                  push(index, type.halfDamageTo);
                                },
                                list: type.halfDamageTo,
                              )),
                              Container(
                                child: TypeEffectivenessDetails(
                                    titleColor: Colors.green,
                                    title: "Resistances",
                                    function: (index) {
                                      push(index, type.halfDamageFrom);
                                    },
                                    list: type.halfDamageFrom),
                              ),
                              Container(
                                  child: TypeEffectivenessDetails(
                                      titleColor: Colors.red,
                                      title: "Weakness",
                                      function: (int index) {
                                        push(index, type.doubleDamageFrom);
                                      },
                                      list: type.doubleDamageFrom)),
                              Container(
                                  child: TypeEffectivenessDetails(
                                      titleColor: Colors.green,
                                      title: "Immunity",
                                      function: (int index) {
                                        push(index, type.noDamageFrom);
                                      },
                                      list: type.noDamageFrom)),
                              Container(
                                  child: TypeEffectivenessDetails(
                                      titleColor: Colors.red,
                                      title: "No Effective",
                                      function: (int index) {
                                        push(index, type.noDamageTo);
                                      },
                                      list: type.noDamageTo))
                            ],
                            elementsPerLine: 1,
                          )
                        ],
                      ),
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
