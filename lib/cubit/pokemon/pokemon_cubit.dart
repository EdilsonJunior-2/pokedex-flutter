import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_repo.dart';
import 'package:pokedex/cubit/state.dart';

class PokemonCubit extends Cubit<StateClass> {
  PokemonCubit({required this.repository}) : super(InitialState());

  final PokemonRepo repository;

  void getPokemon(String url) async {
    try {
      emit(LoadingState());
      final pokemon = await repository.getPokemon(url);
      emit(LoadedStatePokemon(pokemon));
    } catch (e) {
      emit(ErrorState());
    }
  }
}