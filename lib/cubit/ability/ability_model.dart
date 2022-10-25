import 'package:pokedex/schemas.dart';

class AbilityModel {
  const AbilityModel({
    required this.name,
    required this.description,
    required this.listOfPokemon,
    required this.generation,
  });

  final String name;
  final String description;
  final List<OptionsList> listOfPokemon;
  final String generation;
}
