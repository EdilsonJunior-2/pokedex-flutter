import 'package:pokedex/cubit/schemas.dart';
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
    required this.varietyList,
    required this.imageUrl,
    required this.flavorTextEntry,
    required this.locationList,
  });

  final String pokemonName;
  final List<OptionsList> abilities;
  final List<OptionsList> moves;
  final List<OptionsList> types;
  final List<StatsModel> stats;
  final String spriteUrl;
  final String spriteUrlShiny;
  final List<Variety> varietyList;
  final String imageUrl;
  final String flavorTextEntry;
  final List<LocationListModel> locationList;
}
