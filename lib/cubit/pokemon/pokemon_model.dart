import 'package:pokedex/cubit/abilities/abilities_model.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';
import 'package:pokedex/cubit/move_list/move_list_model.dart';

class PokemonModel {
  const PokemonModel({
    required this.pokemonName,
    required this.abilities,
    required this.moves,
    required this.types,
  });

  final String pokemonName;
  final List<AbilitiesModel> abilities;
  final List<MoveListModel> moves;
  final List<TypeListModel> types;
}
