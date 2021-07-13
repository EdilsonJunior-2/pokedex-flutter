import 'package:dio/dio.dart';
import 'package:pokedex/cubit/type_list/type_list_model.dart';

class TypeListRepo {
 TypeListRepo();

  Dio client = Dio();

 Future<List<TypeListModel>> getTypes(String url) async {
    try {
      final response = await client.get(url);

      final types = List<TypeListModel>.of(
          response.data['results'].map<TypeListModel>(
              (json) => TypeListModel(
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