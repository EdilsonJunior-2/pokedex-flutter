import 'package:flutter/material.dart';
import 'package:pokedex/commons/typeDetails.dart';
import 'package:pokedex/cubit/type/type_cubit.dart';
import 'package:pokedex/cubit/type/type_repo.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/functions.dart';
import 'package:pokedex/pages/type_colors.dart';
import 'package:pokedex/schemas.dart';
import 'package:pokedex/commons/grid.dart';

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
                  ),
                  new ListSchema(
                      listName: '${widget.name} moves',
                      typeName: type.name,
                      color: returnColor(type.name),
                      optionsList: type.moves)
                ];
                return Container(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Grid(elements: [
                            Container(
                                child: TypeDetails(
                                    typeName: listOfLists[0].typeName,
                                    listName: listOfLists[0].listName,
                                    color: listOfLists[0].color,
                                    optionsList: listOfLists[0].optionsList)),
                            Container(
                                child: TypeDetails(
                                    typeName: listOfLists[1].typeName,
                                    listName: listOfLists[1].listName,
                                    color: listOfLists[1].color,
                                    optionsList: listOfLists[1].optionsList)),
                            Container(
                                child: TypeDetails(
                                    typeName: listOfLists[1].typeName,
                                    listName: listOfLists[1].listName,
                                    color: listOfLists[1].color,
                                    optionsList: listOfLists[1].optionsList))
                          ], elementsPerLine: 2),
                          /*Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Super effective',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height:
                                        (type.doubleDamageTo.length * 42 + 40),
                                    constraints: BoxConstraints(
                                      maxHeight: 250,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: type.doubleDamageTo.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        height: 42,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Type(
                                                  url: type
                                                      .doubleDamageTo[index]
                                                      .url,
                                                  name: type
                                                      .doubleDamageTo[index]
                                                      .name,
                                                  color: returnColor(type
                                                      .doubleDamageTo[index]
                                                      .name),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            type.doubleDamageTo[index].name,
                                            style: TextStyle(
                                              color: returnColor(type
                                                  .doubleDamageTo[index].name),
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
                                  Text(
                                    'Half effective',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height:
                                        (type.halfDamageTo.length * 42 + 40),
                                    constraints: BoxConstraints(
                                      maxHeight: 250,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: type.halfDamageTo.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        height: 42,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Type(
                                                  url: type
                                                      .halfDamageTo[index].url,
                                                  name: type
                                                      .halfDamageTo[index].name,
                                                  color: returnColor(type
                                                      .halfDamageTo[index]
                                                      .name),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            type.halfDamageTo[index].name,
                                            style: TextStyle(
                                              color: returnColor(type
                                                  .halfDamageTo[index].name),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Resistance',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height:
                                        (type.halfDamageFrom.length * 42 + 40),
                                    constraints: BoxConstraints(
                                      maxHeight: 250,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: type.halfDamageFrom.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        height: 42,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Type(
                                                  url: type
                                                      .halfDamageFrom[index]
                                                      .url,
                                                  name: type
                                                      .halfDamageFrom[index]
                                                      .name,
                                                  color: returnColor(type
                                                      .halfDamageFrom[index]
                                                      .name),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            type.halfDamageFrom[index].name,
                                            style: TextStyle(
                                              color: returnColor(type
                                                  .halfDamageFrom[index].name),
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
                                  Text(
                                    'Weakness',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height: (type.doubleDamageFrom.length * 42 +
                                        40),
                                    constraints: BoxConstraints(
                                      maxHeight: 250,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: type.doubleDamageFrom.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        height: 42,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Type(
                                                  url: type
                                                      .doubleDamageFrom[index]
                                                      .url,
                                                  name: type
                                                      .doubleDamageFrom[index]
                                                      .name,
                                                  color: returnColor(type
                                                      .doubleDamageFrom[index]
                                                      .name),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            type.doubleDamageFrom[index].name,
                                            style: TextStyle(
                                              color: returnColor(type
                                                  .doubleDamageFrom[index]
                                                  .name),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Immunity',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height:
                                        (type.noDamageFrom.length * 42 + 40),
                                    constraints: BoxConstraints(
                                      maxHeight: 250,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: type.noDamageFrom.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        height: 42,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Type(
                                                  url: type
                                                      .noDamageFrom[index].url,
                                                  name: type
                                                      .noDamageFrom[index].name,
                                                  color: returnColor(type
                                                      .noDamageFrom[index]
                                                      .name),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            type.noDamageFrom[index].name,
                                            style: TextStyle(
                                              color: returnColor(type
                                                  .noDamageFrom[index].name),
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
                                  Text(
                                    'No effective',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height: (type.noDamageTo.length * 42 + 40),
                                    constraints: BoxConstraints(
                                      maxHeight: 250,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: type.noDamageTo.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        constraints: BoxConstraints(
                                          maxHeight: 60,
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Type(
                                                  url: type
                                                      .noDamageTo[index].url,
                                                  name: type
                                                      .noDamageTo[index].name,
                                                  color: returnColor(type
                                                      .noDamageTo[index].name),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            type.noDamageTo[index].name,
                                            style: TextStyle(
                                              color: returnColor(
                                                  type.noDamageTo[index].name),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),*/
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
