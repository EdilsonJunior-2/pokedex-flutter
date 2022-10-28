import 'package:flutter/material.dart';
import 'package:pokedex/commons/typeBox.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/pages/types/type.dart';
import 'package:pokedex/pages/type_colors.dart';

class PokemonTypes extends StatefulWidget{
  PokemonTypes({Key? key, required this.typeList}) : super(key: key);

  final List<OptionsList> typeList;
  @override
  _PokemonTypesState createState() => _PokemonTypesState();
}

class _PokemonTypesState extends State<PokemonTypes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.typeList.length * 42),
      width: MediaQuery.of(context).size.width * 0.3,
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.typeList.length,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) => Container(
            height: 30,
            margin: EdgeInsets.only(bottom: 10),
            child: TypeBox(
              bgColor: returnColor(
                widget.typeList[index].name,
              ),
              text: widget.typeList[index].name,
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Type(
                      url: widget.typeList[index].url,
                      name: widget.typeList[index].name,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
        ),
      ),
    );
  }
}