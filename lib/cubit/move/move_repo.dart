import 'package:dio/dio.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';
import 'package:pokedex/cubit/move/move_model.dart';

class MoveRepo {
  MoveRepo();
  Dio client = Dio();

  Future<MoveModel> getMove(String url) async {
    try {
      final response = await client.get(url);

      final pokemon = List<OptionsList>.of(
        response.data['learned_by_pokemon'].map<OptionsList>(
          (json) => OptionsList(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      final description = response.data['flavor_text_entries']
          .where((i) => i['language']['name'] == 'en')
          .toList();
      description.shuffle();

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
        description: description[0]['flavor_text'].toString().replaceAll("\n", " "),
        effect: effect.toString().replaceAll("\n", " "),
        pp: pp,
        power: power,
        damageClass: damageClass,
        type: type,
      );

      return move;
    } catch (e) {
      throw e;
    }
  }
}
