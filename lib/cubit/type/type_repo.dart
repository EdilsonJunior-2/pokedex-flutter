import 'package:dio/dio.dart';
import 'package:pokedex/cubit/type/type_model.dart';
import 'package:pokedex/schemas.dart';

class TypeRepo {
  TypeRepo();
  Dio client = Dio();

  Future<TypeModel> getType(String url) async {
    try {
      final response = await client.get(url);

      final name = response.data['name'];

      final doubleDamageFrom = List<OptionsList>.of(
        response.data['damage_relations']['double_damage_from']
            .map<OptionsList>(
          (json) => OptionsList(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final doubleDamageTo = List<OptionsList>.of(
        response.data['damage_relations']['double_damage_to']
            .map<OptionsList>(
          (json) => OptionsList(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final halfDamageFrom = List<OptionsList>.of(
        response.data['damage_relations']['half_damage_from']
            .map<OptionsList>(
          (json) => OptionsList(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final halfDamageTo = List<OptionsList>.of(
        response.data['damage_relations']['half_damage_to'].map<OptionsList>(
          (json) => OptionsList(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final noDamageFrom = List<OptionsList>.of(
        response.data['damage_relations']['no_damage_from'].map<OptionsList>(
          (json) => OptionsList(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final noDamageTo = List<OptionsList>.of(
        response.data['damage_relations']['no_damage_to'].map<OptionsList>(
          (json) => OptionsList(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final moves = List<OptionsList>.of(
        response.data['moves'].map<OptionsList>((json) => OptionsList(
              name: json['name'],
              url: json['url'],
            )),
      );

      final pokemon = List<OptionsList>.of(
        response.data['pokemon'].map<OptionsList>(
          (json) => OptionsList(
            name: json['pokemon']['name'],
            url: json['pokemon']['url'],
          ),
        ),
      );

      final type = TypeModel(
        name: name,
        doubleDamageTo: doubleDamageTo,
        doubleDamageFrom: doubleDamageFrom,
        halfDamageTo: halfDamageTo,
        halfDamageFrom: halfDamageFrom,
        noDamageTo: noDamageTo,
        noDamageFrom: noDamageFrom,
        moves: moves,
        pokemon: pokemon,
      );

      return type;
    } catch (e) {
      throw e;
    }
  }
}
