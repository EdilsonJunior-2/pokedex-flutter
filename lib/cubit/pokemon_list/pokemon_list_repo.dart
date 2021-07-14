import 'package:dio/dio.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';
import 'package:pokedex/pages/type_colors.dart';

class PokemonListRepo {
  PokemonListRepo();

  Dio client = Dio();

  returnColorByType(colorUrl) async {
    final middleUrl = await client.get(colorUrl);
    final finalUrl =
        await client.get(middleUrl.data['varieties'][0]['pokemon']['url']);
    final color = finalUrl.data['types'][0]['type']['name'];
    return returnColor(color);
  }

  Future<List<PokemonListModel>> getPokemonList(String url) async {
    try {
      final response = await client.get(url);
      final pokemonSpecies = response.data['pokemon_species'];
      pokemonSpecies
          .sort((a, b) => a['name'].toString().compareTo(b['name'].toString()));
      final pokemonList = List<PokemonListModel>.of(
        pokemonSpecies.map<PokemonListModel>(
          (json) => PokemonListModel(
            pokemonName: json['name'],
            url: json['url'],
          ),
        ),
      );

      return pokemonList;
    } catch (e) {
      throw e;
    }
  }
}
