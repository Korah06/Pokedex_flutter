part of 'pokemon_bloc.dart';

enum PokemonStatus { loading, loaded }

@immutable
class PokemonState extends Equatable {
  final List<Pokemon> pokemons;
  final List<Pokemon> selectedPokemons;
  final PokemonStatus status;
  final double progress;

  const PokemonState(
      {this.pokemons = const [],
      this.progress = 0.0,
      this.selectedPokemons = const [],
      this.status = PokemonStatus.loading});

  PokemonState copyWith(
      {List<Pokemon>? pokemons, List<Pokemon>? selectedPokemons, PokemonStatus? status, double? progress}) {
    return PokemonState(
        progress: progress ?? this.progress,
        pokemons: pokemons ?? this.pokemons,
        selectedPokemons: selectedPokemons ?? this.selectedPokemons,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [pokemons, selectedPokemons, status,progress];
}
