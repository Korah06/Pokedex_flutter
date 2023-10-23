part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable{
  const PokemonEvent();

  @override
  List<Object?> get props => [];
}

class LoadPokemonEvent extends PokemonEvent{}

class SelectPokemonEvent extends PokemonEvent{
  final Pokemon pokemon;

  const SelectPokemonEvent({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class NextPokemonEvent extends PokemonEvent{
  final Pokemon pokemon;

  const NextPokemonEvent({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}
class LatePokemonEvent extends PokemonEvent{
  final Pokemon pokemon;

  const LatePokemonEvent({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}