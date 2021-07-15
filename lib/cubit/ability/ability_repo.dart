import 'package:dio/dio.dart';
import 'package:pokedex/cubit/ability/ability_model.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';

class AbilityRepo {
  AbilityRepo();
  Dio client = Dio();

  Future<AbilityModel> getAbility(String url) async {
    try {
      final response = await client.get(url);

      final pokemonList = List<PokemonListModel>.of(
        response.data["pokemon"].map<PokemonListModel>(
          (json) => PokemonListModel(
            pokemonName: json['pokemon']['name'],
            url: json['pokemon']['url'],
          ),
        ),
      );

      final descriptionList = response.data["effect_entries"]
          .where((i) => i['language']['name'] == 'en')
          .toList();
      descriptionList.shuffle();

      final ability = AbilityModel(
        name: response.data['name'],
        description: descriptionList[0]['effect'].toString().replaceAll("\n", " "),
        listOfPokemon: pokemonList,
        generation: response.data['generation']['name'],
      );

      return ability;
    } catch (e) {
      throw e;
    }
  }
}
