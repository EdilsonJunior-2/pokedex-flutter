import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';
import 'package:pokedex/pages/pokemon/pokemon_list_generation.dart';

class PokemonListPage extends StatefulWidget {
  PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late List<PokemonListModel> pokemonList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF98D8D8),
        title: Text("Pokemon List"),
        /*actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Container(child: Icon(Icons.search),),
          ),
        ],*/
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonListGenerationPage(
                                url: 'https://pokeapi.co/api/v2/generation/1',
                                generation: 'Kanto',
                                color: Color(0xFF78C850),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Kanto",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF78C850),
                        ),
                      ),
                      Container(margin: const EdgeInsets.all(10)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonListGenerationPage(
                                url: 'https://pokeapi.co/api/v2/generation/3',
                                generation: 'Hooen',
                                color: Color(0xFF6890F0),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Hooen",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF6890F0),
                        ),
                      ),
                      Container(margin: const EdgeInsets.all(10)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonListGenerationPage(
                                url: 'https://pokeapi.co/api/v2/generation/5',
                                generation: 'Unova',
                                color: Color(0xFFE0C068),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Unova",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFE0C068),
                        ),
                      ),
                      Container(margin: const EdgeInsets.all(10)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonListGenerationPage(
                                url: 'https://pokeapi.co/api/v2/generation/7',
                                generation: 'Alola',
                                color: Color(0xFFC03028),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Alola",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFC03028),
                        ),
                      ),
                    ],
                  ),
                  Container(margin: const EdgeInsets.all(20)),
                  Column(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonListGenerationPage(
                                url: 'https://pokeapi.co/api/v2/generation/2',
                                generation: 'Jothoh',
                                color: Color(0xFFF08030),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Jothoh",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFF08030),
                        ),
                      ),
                      Container(margin: const EdgeInsets.all(10)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonListGenerationPage(
                                url: 'https://pokeapi.co/api/v2/generation/4',
                                generation: 'Sinnoh',
                                color: Color(0xFFF8D030),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Sinnoh",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFF8D030),
                        ),
                      ),
                      Container(margin: const EdgeInsets.all(10)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonListGenerationPage(
                                url: 'https://pokeapi.co/api/v2/generation/6',
                                generation: 'Kalos',
                                color: Color(0xFFEE99AC),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Kalos",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFEE99AC),
                        ),
                      ),
                      Container(margin: const EdgeInsets.all(10)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonListGenerationPage(
                                url: 'https://pokeapi.co/api/v2/generation/8',
                                generation: 'Galar',
                                color: Color(0xFFF85888),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Galar",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFF85888),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
