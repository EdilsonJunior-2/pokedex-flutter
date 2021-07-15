import 'package:flutter/material.dart';
import 'package:pokedex/functions.dart';
import 'package:pokedex/cubit/move/move_repo.dart';
import 'package:pokedex/cubit/move/move_cubit.dart';
import 'package:pokedex/cubit/state.dart';
import 'package:pokedex/pages/type_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/pages/types/type.dart';
import 'package:pokedex/pages/pokemon/pokemon.dart';

class Move extends StatefulWidget {
  Move({Key? key, required this.url, required this.name}) : super(key: key);

  final String url;
  final String name;

  @override
  _MoveState createState() => _MoveState();
}

class _MoveState extends State<Move> {
  textStyle(moveName) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: returnColor(moveName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MoveCubit>(
        create: (context) =>
            MoveCubit(repository: MoveRepo())..getMove(widget.url),
        child: SingleChildScrollView(
          child: BlocBuilder<MoveCubit, StateClass>(
            builder: (context, state) {
              if (state is LoadingState) {
                return loading(context);
              } else if (state is ErrorState) {
                return Center(
                  child: Text(
                    "An error occurred while getting the info about this move, or there is no info about it, sorry :(",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                );
              } else if (state is LoadedStateMove) {
                final move = state.element;

                return Container(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.5,
                      ),
                      margin: const EdgeInsets.only(
                        top: 35,
                        bottom: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                    ),
                                    color: returnColor(
                                      move.type.name,
                                    ),
                                    onPressed: () => {
                                      Navigator.pop(context),
                                    },
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: returnColor(
                                        move.type.name,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.95,
                            margin: EdgeInsets.only(
                              bottom: 20,
                            ),
                            color: returnColor(
                              move.type.name,
                            ),
                          ),
                          Text(
                            move.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: returnColor(
                                  move.type.name,
                                )
                            ),
                          ),
                          Container(margin: const EdgeInsets.all(10),),
                          Text(
                            "Effect: ${move.effect}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              color: returnColor(
                                move.type.name,
                              )
                            ),
                          ),
                          Container(margin: const EdgeInsets.all(10),),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.95,
                            margin: EdgeInsets.only(
                              bottom: 20,
                            ),
                            color: returnColor(
                              move.type.name,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Type(
                                    url: move.type.url,
                                    name: move.type.name,
                                    color: returnColor(move.type.name),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Type: ${move.type.name}",
                              textAlign: TextAlign.center,
                              style: textStyle(move.type.name),
                            ),
                          ),
                          Text(
                            "Class: ${move.damageClass}",
                            textAlign: TextAlign.center,
                            style: textStyle(move.type.name),
                          ),
                          Container(margin: const EdgeInsets.all(10),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "PP: ${isNullOrNot(move.pp)}",
                                textAlign: TextAlign.center,
                                style: textStyle(move.type.name),
                              ),
                              Text(
                                "Power: ${isNullOrNot(move.power)}",
                                textAlign: TextAlign.center,
                                style: textStyle(move.type.name),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.95,
                            margin: EdgeInsets.only(
                              bottom: 20,
                            ),
                            color: returnColor(
                              move.type.name,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Pokemon that can learn ${widget.name}',
                                style: TextStyle(
                                  color: returnColor(move.type.name),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: (move.pokemon.length * 42 + 40),
                                constraints: BoxConstraints(
                                  maxHeight: 250,
                                ),
                                width: MediaQuery.of(context).size.width * 0.4,
                                color: Colors.white,
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  bottom: 20,
                                ),
                                margin: EdgeInsets.only(
                                  top: 20,
                                  bottom: 20,
                                  left:
                                      MediaQuery.of(context).size.width * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                child: ListView.builder(
                                  itemCount: move.pokemon.length,
                                  itemBuilder: (context, index) => Container(
                                    height: 42,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Pokemon(
                                              url: move.pokemon[index].url,
                                              name: move
                                                  .pokemon[index].pokemonName,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        move.pokemon[index].pokemonName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: returnColor(move.type.name,),
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
