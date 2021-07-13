import 'package:dio/dio.dart';
import 'package:pokedex/cubit/type/type_model.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';
import 'package:pokedex/cubit/move_list/move_list_model.dart';

class TypeRepo {
  TypeRepo();
  Dio client = Dio();

  Future<TypeModel> getType(String url) async {
    try {
      final response = await client.get(url);

      final name = response.data['name'];

      final doubleDamageFrom = List<TypeListModel>.of(
        response.data['damage_relations']['double_damage_from']
            .map<TypeListModel>(
          (json) => TypeListModel(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final doubleDamageTo = List<TypeListModel>.of(
        response.data['damage_relations']['double_damage_to']
            .map<TypeListModel>(
          (json) => TypeListModel(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final halfDamageFrom = List<TypeListModel>.of(
        response.data['damage_relations']['half_damage_from']
            .map<TypeListModel>(
          (json) => TypeListModel(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final halfDamageTo = List<TypeListModel>.of(
        response.data['damage_relations']['half_damage_to'].map<TypeListModel>(
          (json) => TypeListModel(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final noDamageFrom = List<TypeListModel>.of(
        response.data['damage_relations']['no_damage_from'].map<TypeListModel>(
          (json) => TypeListModel(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final noDamageTo = List<TypeListModel>.of(
        response.data['damage_relations']['no_damage_to'].map<TypeListModel>(
          (json) => TypeListModel(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final moves = List<MoveListModel>.of(
        response.data['moves'].map<MoveListModel>((json) => MoveListModel(
              name: json['name'],
              url: json['url'],
            )),
      );

      final pokemon = List<PokemonListModel>.of(
        response.data['pokemon'].map<PokemonListModel>((json) => PokemonListModel(
              pokemonName: json['pokemon']['name'],
              url: json['pokemon']['url'],
            )),
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
