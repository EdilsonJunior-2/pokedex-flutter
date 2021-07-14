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
      final response2 =
          await client.get(response.data["varieties"][0]["pokemon"]["url"]);

      final imageUrl = response2.data['sprites']['other']['official-artwork']
          ['front_default'];

      final spriteUrl = response2.data['sprites']['front_default'];

      final spriteUrlShiny = response2.data['sprites']['front_shiny'];

      final flavorTextEntries = response.data["flavor_text_entries"]
          .where((i) => i['language']['name'] == 'en')
          .toList();
      flavorTextEntries.shuffle();
      final finalFlavorText =
          flavorTextEntries[0]['flavor_text'].toString().replaceAll("\n", " ");

      final abilities = List<AbilitiesModel>.of(
        response2.data["abilities"].map<AbilitiesModel>(
          (json) => AbilitiesModel(
            name: json['ability']['name'],
            url: json['ability']['url'],
          ),
        ),
      );

      final moves = List<MoveListModel>.of(
        response2.data['moves'].map<MoveListModel>(
          (json) => MoveListModel(
            name: json['move']['name'],
            url: json['move']['url'],
          ),
        ),
      );

      final types = List<TypeListModel>.of(
        response2.data['types'].map<TypeListModel>(
          (json) => TypeListModel(
            name: json['type']['name'],
            url: json['type']['url'],
          ),
        ),
      );

      final pokemon = PokemonModel(
        pokemonName: response2.data['name'],
        abilities: abilities,
        moves: moves,
        types: types,
        spriteUrl: spriteUrl,
        spriteUrlShiny: spriteUrlShiny,
        imageUrl: imageUrl,
        flavorTextEntry: finalFlavorText,
      );

      return pokemon;
    } catch (e) {
      throw e;
    }
  }
}
