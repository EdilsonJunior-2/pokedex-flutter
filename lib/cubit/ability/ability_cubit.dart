import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/ability/ability_repo.dart';
import 'package:pokedex/cubit/state.dart';

class AbilityCubit extends Cubit<StateClass> {
  AbilityCubit({required this.repository}) : super(InitialState());

  final AbilityRepo repository;

  void getAbility(String url) async {
    try {
      emit(LoadingState());
      final ability = await repository.getAbility(url);
      emit(LoadedStateAbility(ability));
    } catch (e) {
      emit(ErrorState());
    }
  }
}