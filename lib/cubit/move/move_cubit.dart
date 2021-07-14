import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/move/move_repo.dart';
import 'package:pokedex/cubit/state.dart';

class MoveCubit extends Cubit<StateClass> {
  MoveCubit({required this.repository}) : super(InitialState());

  final MoveRepo repository;

  void getMove(String url) async {
    try {
      emit(LoadingState());
      final move = await repository.getMove(url);
      emit(LoadedStateMove(move));
    } catch (e) {
      emit(ErrorState());
    }
  }
}