import 'package:dio/dio.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';
import 'package:pokedex/cubit/move/move_model.dart';

class MoveRepo {
  MoveRepo();
  Dio client = Dio();

  Future<MoveModel> getMove(String url) async {
    try {
      final response = await client.get(url);

      final pokemon = List<PokemonListModel>.of(
        response.data['learned_by_pokemon'].map<PokemonListModel>(
          (json) => PokemonListModel(
            pokemonName: json['name'],
            url: json['url'],
          ),
        ),
      );

      final description =
          response.data['flavor_text_entries'][1]['flavor_text'];

      final effect = response.data['effect_entries'][0]['effect'];

      final pp = response.data['pp'].toString();

      final power = response.data['power'].toString();

      final damageClass = response.data['damage_class']['name'];

      final type = TypeListModel(
        url: response.data['type']['url'],
        name: response.data['type']['name'],
      );

      final move = MoveModel(
        pokemon: pokemon,
        description: description,
        effect: effect,
        pp: pp,
        power: power,
        damageClass: damageClass,
        type: type,
      );

      return move;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
