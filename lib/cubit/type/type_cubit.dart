import 'package:pokedex/cubit/type/type_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/state.dart';

class TypeCubit extends Cubit<StateClass> {
  TypeCubit({required this.repository}) : super(InitialState());

  final TypeRepo repository;

  void getType(String url) async {
    try {
      emit(LoadingState());
      final type = await repository.getType(url);
      emit(LoadedStateType(type));
    } catch (e) {
      emit(ErrorState());
    }
  }
}