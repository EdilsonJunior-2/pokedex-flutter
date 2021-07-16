import 'package:pokedex/cubit/abilities/abilities_model.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';
import 'package:pokedex/cubit/move_list/move_list_model.dart';
import 'package:pokedex/cubit/location_list/location_list_model.dart';
import 'package:pokedex/cubit/stats/stats_model.dart';
class PokemonModel {
  const PokemonModel({
    required this.pokemonName,
    required this.abilities,
    required this.moves,
    required this.types,
    required this.stats,
    required this.spriteUrl,
    required this.spriteUrlShiny,
    required this.imageUrl,
    required this.flavorTextEntry,
    required this.locationList,
  });

  final String pokemonName;
  final List<AbilitiesModel> abilities;
  final List<MoveListModel> moves;
  final List<TypeListModel> types;
  final List<StatsModel> stats;
  final String spriteUrl;
  final String spriteUrlShiny;
  final String imageUrl;
  final String flavorTextEntry;
  final List<LocationListModel> locationList;
}
