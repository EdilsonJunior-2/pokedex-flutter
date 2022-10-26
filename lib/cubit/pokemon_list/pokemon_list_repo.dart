import 'package:dio/dio.dart';
import 'package:pokedex/helpers/schemas.dart';
import 'package:pokedex/pages/type_colors.dart';
import 'package:pokedex/functions.dart';
import 'package:pokedex/helpers/utils.dart';

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

  Future<List<OptionsList>> getPokemonList(String url) async {
    try {
      final response = await client.get(url);
      final pokemonSpecies = response.data['pokemon_species'];
      pokemonSpecies.sort((a, b) => getPokemonNumber(a['url'].toString())
          .compareTo(getPokemonNumber(b['url'].toString())));
      final pokemonList = List<OptionsList>.of(
        pokemonSpecies.map<OptionsList>((json) => OptionsList(
            name: json['name'],
            url: json['url'],
            image:
                '${getFrontDefaultSpriteUrl()}/${getPokemonNumber(json['url'].toString())}.png')),
      );
      print(pokemonList[2].image);
      return pokemonList;
    } catch (e) {
      throw e;
    }
  }
}
