import 'package:equatable/equatable.dart';
import 'package:pokedex/cubit/ability/ability_model.dart';
import 'package:pokedex/helpers/schemas.dart';
import 'package:pokedex/cubit/pokemon/pokemon_model.dart';
import 'package:pokedex/cubit/type/type_model.dart';
import 'package:pokedex/cubit/move/move_model.dart';

abstract class StateClass extends Equatable {}

class InitialState extends StateClass {
  @override
  List<Object> get props => [];
}

class LoadingState extends StateClass {
  @override
  List<Object> get props => [];
}

class LoadedStateAbilitiesList extends StateClass {
  LoadedStateAbilitiesList(this.element);

  final List<OptionsList> element;

  @override
  List<Object> get props => [element];
}

class LoadedStateAbility extends StateClass {
  LoadedStateAbility(this.element);

  final AbilityModel element;

  @override
  List<Object> get props => [element];
}

class LoadedStatePokemonList extends StateClass {
  LoadedStatePokemonList(this.element);

  final List<OptionsList> element;

  @override
  List<Object> get props => [element];
}

class LoadedStatePokemon extends StateClass {
  LoadedStatePokemon(this.element);

  final PokemonModel element;

  @override
  List<Object> get props => [element];
}

class LoadedStateTypeList extends StateClass {
  LoadedStateTypeList(this.element);

  final List<OptionsList> element;

  @override
  List<Object> get props => [element];
}

class LoadedStateType extends StateClass {
  LoadedStateType(this.element);

  final TypeModel element;

  @override
  List<Object> get props => [element];
}

class LoadedStateMove extends StateClass {
  LoadedStateMove(this.element);

  final MoveModel element;

  @override
  List<Object> get props => [element];
}

class ErrorState extends StateClass {
  @override
  List<Object> get props => [];
}