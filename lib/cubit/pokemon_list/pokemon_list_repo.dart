import 'package:dio/dio.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';

class PokemonListRepo {
  PokemonListRepo();

  Dio client = Dio();

  Future<List<PokemonListModel>> getPokemonList(String url) async {
    try {
      final response = await client.get(url);
      final pokemonSpecies = response.data['pokemon_species'];
      pokemonSpecies.sort((a, b) => a['name'].toString().compareTo(b['name'].toString()));
      final pokemonList = List<PokemonListModel>.of(
        pokemonSpecies.map<PokemonListModel>(
              (json) => PokemonListModel(
            pokemonName: json['name'],
            url: json['url'],
          ),
        ),
      );

      print(pokemonSpecies);

      return pokemonList;
    } catch (e){
      throw e;
    }
  }
}

