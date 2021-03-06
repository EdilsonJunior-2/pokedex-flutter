import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';

class AbilityModel {
  const AbilityModel({
    required this.name,
    required this.description,
    required this.listOfPokemon,
    required this.generation,
  });

  final String name;
  final String description;
  final List<PokemonListModel> listOfPokemon;
  final String generation;
}
