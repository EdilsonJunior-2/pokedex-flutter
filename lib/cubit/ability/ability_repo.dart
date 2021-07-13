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

      final ability = AbilityModel(
        name: response.data['name'],
        description: response.data['effect_entries'][1]['effect'],
        listOfPokemon: pokemonList
      );

      return ability;
    } catch (e) {
      throw e;
    }
  }
}
