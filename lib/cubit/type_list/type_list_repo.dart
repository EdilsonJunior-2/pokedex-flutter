import 'package:dio/dio.dart';
import 'package:pokedex/cubit/schemas.dart';

class TypeListRepo {
 TypeListRepo();

  Dio client = Dio();

 Future<List<OptionsList>> getTypes(String url) async {
    try {
      final response = await client.get(url);

      final types = List<OptionsList>.of(
          response.data['results'].map<OptionsList>(
              (json) => OptionsList(
            name: json['name'],
            url: json['url'],
          ),
        ),
      );

      return types;
    } catch (e){
      throw e;
    }
  }
}