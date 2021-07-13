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
      final response2 = await client.get(response.data["species"]["url"]);
      final flavorTextEntries = response2.data["flavor_text_entries"]
          .where((i) => i['language']['name'] == 'en')
          .toList();
      final imageUrl = response.data['sprites']['other']['official-artwork']
          ['front_default'];
      final spriteUrl = response.data['sprites']['front_default'];
      final spriteUrlShiny = response.data['sprites']['front_shiny'];
      flavorTextEntries.shuffle();
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
        spriteUrl: spriteUrl,
        spriteUrlShiny: spriteUrlShiny,
        imageUrl: imageUrl,
        flavorTextEntry:
            flavorTextEntries[0]['flavor_text'].replaceAll("\n", " "),
      );

      return pokemon;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
