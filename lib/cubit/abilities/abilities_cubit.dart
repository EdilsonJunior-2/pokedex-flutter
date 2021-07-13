import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/abilities/abilities_repo.dart';
import 'package:pokedex/cubit/state.dart';

class AbilitiesCubit extends Cubit<StateClass> {
  AbilitiesCubit({required this.repository}) : super(InitialState());

  final AbilitiesRepo repository;

  void getAbilities(String url) async {
    try {
      emit(LoadingState());
      final abilities = await repository.getAbilities(url);
      emit(LoadedStateAbilitiesList(abilities));
    } catch (e) {
      emit(ErrorState());
    }
  }
}