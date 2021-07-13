import 'package:pokedex/cubit/type_list/type_list_model.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';
import 'package:pokedex/cubit/move_list/move_list_model.dart';

class TypeModel{
  const TypeModel({
    required this.name,
    required this.doubleDamageTo,
    required this.doubleDamageFrom,
    required this.halfDamageTo,
    required this.halfDamageFrom,
    required this.noDamageTo,
    required this.noDamageFrom,
    required this.moves,
    required this.pokemon,
});

  final String name;
  final List<TypeListModel> doubleDamageTo;
  final List<TypeListModel> doubleDamageFrom;
  final List<TypeListModel> halfDamageTo;
  final List<TypeListModel> halfDamageFrom;
  final List<TypeListModel> noDamageTo;
  final List<TypeListModel> noDamageFrom;
  final List<MoveListModel> moves;
  final List<PokemonListModel> pokemon;
}