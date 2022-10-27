import 'package:dio/dio.dart';
import 'package:pokedex/cubit/schemas.dart';

class AbilitiesRepo {
  AbilitiesRepo();

  Dio client = Dio();

  Future<List<OptionsList>> getAbilities(String url) async {
    try {
      final response = await client.get(url);
      final abilitiesList = response.data["results"];
      abilitiesList.sort((a, b) => a['name'].toString().compareTo(b['name'].toString()));

      final abilities = List<OptionsList>.of(
        abilitiesList.map<OptionsList>(
              (json) => OptionsList(
                name: json['name'],
                url: json['url'],
              ),
        ),
      );

      return abilities;
    } catch (e){
      throw e;
    }
  }
}

