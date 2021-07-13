import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/type_list/type_list_repo.dart';
import 'package:pokedex/cubit/state.dart';

class TypeListCubit extends Cubit<StateClass> {
  TypeListCubit({required this.repository}) : super(InitialState());

  final TypeListRepo repository;

  void getTypes(String url) async {
    try {
      emit(LoadingState());
      final types = await repository.getTypes(url);
      emit(LoadedStateTypeList(types));
    } catch (e) {
      emit(ErrorState());
    }
  }
}