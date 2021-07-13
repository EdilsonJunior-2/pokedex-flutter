import 'package:dio/dio.dart';
import 'package:pokedex/cubit/pokemon/pokemon_model.dart';
import 'package:pokedex/cubit/move_list/move_list_model.dart';
import 'package:pokedex/cubit/abilities/abilities_model.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';

class PokemonRepo {
  PokemonRepo();
  Dio client = Dio();

  Future<PokemonModel> getPokemon(String url) async {
    try {
      final response = await client.get(url);
      print(response.data["results"]);

      final abilities = List<AbilitiesModel>.of(
        response.data["abilities"].map<AbilitiesModel>(
          (json) => AbilitiesModel(
            name: json['ability']['name'],
            url: json['ability']['url'],
          ),
        ),
      );

      final moves = List<MoveListModel>.of(
        response.data['moves'].map<MoveListModel>(
          (json) => MoveListModel(
            name: json['move']['name'],
            url: json['move']['url'],
          ),
        ),
      );

      final types = List<TypeListModel>.of(
        response.data['types'].map<TypeListModel>(
          (json) => TypeListModel(
            name: json['type']['name'],
            url: json['type']['url'],
          ),
        ),
      );

      final pokemon = PokemonModel(
        pokemonName: response.data['name'],
        abilities: abilities,
        moves: moves,
        types: types,
      );

      return pokemon;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
