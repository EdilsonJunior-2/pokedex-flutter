import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/commons/grid.dart';
import 'package:pokedex/commons/scrollableContainer.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/pages/pokemon/pokemonListView.dart';
import 'package:pokedex/store/generations.dart';
import 'package:pokedex/commons/customButton.dart';
import 'package:pokedex/store/links.dart';

class PokemonListPage extends StatefulWidget {
  PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late List<OptionsList> pokemonList;

  generations() {
    return regionList.map(
      (region) => Container(
        width: MediaQuery.of(context).size.width * .45,
        height: MediaQuery.of(context).size.height * .2,
        margin: EdgeInsets.only(
            bottom: 10,
            left: MediaQuery.of(context).size.width * .025,
            right: MediaQuery.of(context).size.width * .025),
        child: CustomButton(
          text: region.name,
          color: Colors.white,
          bgColor: region.color,
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonListGenerationPage(
                  url: pokeapiGeneralLink +
                      "/generation/" +
                      region.generationNumber.toString(),
                  generation: region.name,
                  color: region.color,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF98D8D8),
        title: Text("Pokemon List"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: ScrollableContainer(
          container: Container(
            margin: EdgeInsets.only(
              top: 30
            ),
            child: Grid(elements: [...generations()], elementsPerLine: 2),
          ),
        ),
      ),
    );
  }
}
