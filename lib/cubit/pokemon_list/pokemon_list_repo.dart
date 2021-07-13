import 'package:dio/dio.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_model.dart';

class PokemonListRepo {
  PokemonListRepo();

  Dio client = Dio();

  Future<List<PokemonListModel>> getPokemonList(String url) async {
    try {
      final response = await client.get(url);

      final pokemonList = List<PokemonListModel>.of(
        response.data["pokemon_species"].map<PokemonListModel>(
              (json) => PokemonListModel(
            pokemonName: json['name'],
            url: json['url'],
          ),
        ),
      );

      return pokemonList;
    } catch (e){
      throw e;
    }
  }
}

