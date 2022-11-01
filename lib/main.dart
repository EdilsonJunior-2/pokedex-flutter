import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/abilities/abilities_list.dart';
import 'package:pokedex/pages/pokemon/selectGenerationView.dart';
import 'package:pokedex/pages/types/type_list.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => MyHomePage(),
          '/abilities': (context) => AbilitiesPage(),
          '/pokemon': (context) => PokemonListPage(),
          '/types': (context) => TypeListPage(),
        });
  }
}
