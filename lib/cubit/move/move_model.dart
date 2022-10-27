import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';

class MoveModel {
  const MoveModel({
    required this.pokemon,
    required this.description,
    required this.effect,
    required this.pp,
    required this.power,
    required this.damageClass,
    required this.type,
  });

  final List<OptionsList> pokemon;
  final String description;
  final String effect;
  final String pp;
  final String power;
  final String damageClass;
  final TypeListModel type;
}