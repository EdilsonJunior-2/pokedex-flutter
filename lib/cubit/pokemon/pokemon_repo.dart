import 'package:dio/dio.dart';
import 'package:pokedex/cubit/location_list/location_list_model.dart';
import 'package:pokedex/cubit/pokemon/pokemon_model.dart';
import 'package:pokedex/cubit/stats/stats_model.dart';
import 'package:pokedex/helpers/schemas.dart';

class PokemonRepo {
  PokemonRepo();
  Dio client = Dio();

  Future<PokemonModel> getPokemon(String url) async {
    try {
      var temporaryResponse1 = await client.get(url);
      var temporaryResponse2;
      if (temporaryResponse1.data["varieties"] != null) {
        temporaryResponse2 = await client
            .get(temporaryResponse1.data["varieties"][0]["pokemon"]["url"]);
      } else {
        temporaryResponse2 =
            await client.get(temporaryResponse1.data["species"]["url"]);
        var aux = temporaryResponse2;
        temporaryResponse2 = temporaryResponse1;
        temporaryResponse1 = aux;
      }
      final response = temporaryResponse1;
      final response2 = temporaryResponse2;

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

      final abilities = List<OptionsList>.of(
        response2.data["abilities"].map<OptionsList>(
          (json) => OptionsList(
            name: json['ability']['name'],
            url: json['ability']['url'],
          ),
        ),
      );
      abilities.sort((a, b) => a.name.toString().compareTo(b.name.toString()));

      final response3 =
          await client.get(response2.data['location_area_encounters']);
      final locationArea = List<LocationListModel>.of(
        response3.data.map<LocationListModel>(
          (json) => LocationListModel(
            locationName: json['location_area']['name'].toString().replaceAll("-", " "),
          ),
        ),
      );
      locationArea.sort(
        (a, b) => a.locationName.toString().compareTo(
              b.locationName.toString(),
            ),
      );

      final moves = List<OptionsList>.of(
        response2.data['moves'].map<OptionsList>(
          (json) => OptionsList(
            name: json['move']['name'],
            url: json['move']['url'],
          ),
        ),
      );
      moves.sort((a, b) => a.name.toString().compareTo(b.name.toString()));

      final types = List<OptionsList>.of(
        response2.data['types'].map<OptionsList>(
          (json) => OptionsList(
            name: json['type']['name'],
            url: json['type']['url'],
          ),
        ),
      );
      types.sort((a, b) => a.name.toString().compareTo(b.name.toString()));

      final stats = List<StatsModel>.of(
        response2.data['stats'].map<StatsModel>(
          (json) => StatsModel(
            name: json['stat']['name'],
            value: json['base_stat'],
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
        stats: stats,
        locationList: locationArea,
      );

      return pokemon;
    } catch (e) {
      throw e;
    }
  }
}
