import 'package:dio/dio.dart';
import 'package:pokedex/cubit/abilities/abilities_model.dart';

class AbilitiesRepo {
  AbilitiesRepo();

  Dio client = Dio();

  Future<List<AbilitiesModel>> getAbilities(String url) async {
    try {
      final response = await client.get(url);
      final abilitiesList = response.data["results"];
      abilitiesList.sort((a, b) => a['name'].toString().compareTo(b['name'].toString()));

      final abilities = List<AbilitiesModel>.of(
        abilitiesList.map<AbilitiesModel>(
              (json) => AbilitiesModel(
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

