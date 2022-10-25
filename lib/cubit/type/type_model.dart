import 'package:pokedex/schemas.dart';

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
  final List<OptionsList> doubleDamageTo;
  final List<OptionsList> doubleDamageFrom;
  final List<OptionsList> halfDamageTo;
  final List<OptionsList> halfDamageFrom;
  final List<OptionsList> noDamageTo;
  final List<OptionsList> noDamageFrom;
  final List<OptionsList> moves;
  final List<OptionsList> pokemon;
}