import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_test_flutter/domain/repositories/dio/dio_pokemon.dart';

import '../../../data/models/Pokemon.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
    on<LoadPokemonEvent>(_onLoadPokemonEvent);
    on<SelectPokemonEvent>(_onSelectPokemonEvent);
    on<NextPokemonEvent>(_onNextPokemonEvent);
    on<LatePokemonEvent>(_onLatePokemonEvent);
  }

  FutureOr<void> _onLoadPokemonEvent(
      LoadPokemonEvent event, Emitter<PokemonState> emit) async {
    List<Pokemon> pokemons = [];
    const count = 33;
    for (int i = 1; i < count; i++) {
      Pokemon p = await IDioPokemonRepository.getPokemon(i);
      pokemons.add(p);
      emit(state.copyWith(progress: pokemons.length/33));
    }

    emit(state.copyWith(status: PokemonStatus.loaded, pokemons: pokemons));
  }

  FutureOr<void> _onSelectPokemonEvent(SelectPokemonEvent event, Emitter<PokemonState> emit) {
    emit(state.copyWith(selectedPokemons: [event.pokemon]));
  }

  FutureOr<void> _onNextPokemonEvent(NextPokemonEvent event, Emitter<PokemonState> emit) {}

  FutureOr<void> _onLatePokemonEvent(LatePokemonEvent event, Emitter<PokemonState> emit) {}
}
