import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon_list/pokemon_list_repo.dart';
import 'package:pokedex/cubit/state.dart';

class PokemonListCubit extends Cubit<StateClass> {
  PokemonListCubit({required this.repository}) : super(InitialState());

  final PokemonListRepo repository;

  void getPokemon(String url) async {
    try {
      emit(LoadingState());
      final pokemonList = await repository.getPokemonList(url);
      emit(LoadedStatePokemonList(pokemonList));
    } catch (e) {
      emit(ErrorState());
    }
  }
}